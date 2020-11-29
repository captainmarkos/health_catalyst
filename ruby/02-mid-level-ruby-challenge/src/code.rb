# frozen_string_literal: true

require 'pry'
require 'csv'

module Code
  def self.parse_csv(filepath, type)
    case type
    when :patients
      keys = %w(date_of_birth given_name family_name
                phone_number sex external_id)
    when :clinical_activities
      keys = %w(code_type code_value result claim_id
                patient_external_id external_id)
    end

    data = CSV.read(filepath).map do |row|
      Hash[ keys.zip(row) ]
    end
    data.slice(1, data.length)
  end

  def self.process_patients(days)
    1.upto(days).each_with_object([]) do |day, result|
      result << parse_csv("data/patients-day-#{day}.csv", :patients)
    end
  end

  def self.process_clinical_activities(days)
    1.upto(days).each_with_object([]) do |day, result|
      filepath = "data/clinical_activities-day-#{day}.csv"
      result << parse_csv(filepath, :clinical_activities);
    end
  end

  def self.collect_new(pdata, day)
    new_patients = pdata.first

    pdata.slice(1, pdata.length).each do |pdata_day|
      records = pdata_day.each_with_object([]) do |item, result|
        exists = new_patients.detect do |i|
          item['external_id'] == i['external_id']
        end
        result << item if exists.nil?
      end
      new_patients += records
    end
    new_patients
  end

  def self.collect_changed(pdata, cdata, day)
    new_patients = collect_new(pdata, day)

    changed = []
    pdata.slice(1, pdata.length).each do |pdata_day|
      records = pdata_day.each_with_object([]) do |item, result|
        exists = new_patients.detect do |i|
          item['date_of_birth'] == i['date_of_birth'] &&
          item['given_name'] == i['given_name'] &&
          item['family_name'] == i['family_name']
          item['phone_number'] == i['phone_number'] &&
          item['sex'] == i['sex']
        end
        result << item if exists.nil?
      end
      changed += records
    end

    # Merge the hashes in new_patients array with those in the changed array.
    new_patients = merge_records((new_patients |= changed))

    changed |= changed_by_clinical_activities(new_patients, cdata, day)
  end

  def self.merge_records(aoh)
    # Merge an array of hashes that are grouped by a hash key.
    aoh.group_by do |h|
      h['external_id']
    end.map { |_, hs| hs.reduce(:merge) }
  end

  def self.changed_by_clinical_activities(pdata, cdata, day)
    clinical_data = cdata.flatten
    pdata.each_with_object([]) do |patient, result|
      exists = clinical_data.detect do |item|
        item['patient_external_id'] == patient['external_id']
      end
      result << patient unless exists.nil?
    end
  end

  # Output the patient records that are new or changed for a given day.
  # A new or changed patient is defined as having any of the following:
  #   - Having a new or changed record in the patients file for the day
  #   - Having a record in the clinical_activities file for the day

  def self.column_names(data)
    "\n\"#{data.first.keys.join('","')}\""
  end

  def self.column_data(data, status)
    rows = data.each_with_object([]) do |h, r|
      r << "\"#{h.values.join('","')}\""
    end
    rows.unshift("--- #{status} - #{rows.length} ---")
    rows << "\n"
  end

  # def self.collect_dups(data)
  #   data.flatten.group_by do |h|
  #     h['external_id']
  #   end.values.select { |i| i.size > 1 }.flatten.uniq
  # end
end
