# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

require_relative '../src/code'
require 'tempfile'

RSpec.describe Code do
  describe '.parse_csv' do
    subject { Code.parse_csv(filepath, :patients) }

    context 'when a valid filepath is passed' do
      let(:filepath) { File.join(File.dirname(__FILE__), '../data/patients-day-1.csv') }

      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end

      it 'has correct number of patient records' do
        expect(subject.length).to eq 68
      end
    end
  end

  describe '.process_patients' do
    subject { Code.process_patients(day) }

    context 'reads patient data file' do
      let(:day) { 1 }

      it 'has correct number of patient records' do
        expect(subject.flatten.length).to eq 68
      end
    end
  end

  describe '.collect_new' do
    subject { Code.collect_new(records, day) }

    context 'collects new paitents from data files' do
      let(:day) { 2 }
      let(:records) { Code.process_patients(day) }

      it 'has correct number of new patient records' do
        expect(subject.flatten.length).to eq 83
      end
    end
  end

  describe '.collect_changed' do
    subject { Code.collect_changed(patients, clinical_activities, day) }

    context 'collects new paitents from data files' do
      let(:day) { 2 }
      let(:patients) { Code.process_patients(day) }
      let(:clinical_activities) { Code.process_clinical_activities(day)}

      it 'has correct number of new patient records' do
        expect(subject.flatten.length).to eq 77
      end
    end
  end

  describe '.column_names' do
    subject { Code.column_names(patients.flatten) }
    context 'column names for printing results' do
      let(:day) { 1 }
      let(:patients) { Code.process_patients(day) }
      it 'is comma separated column names' do
        expect(subject).to match(/\"date_of_birth\",\"given_name\",\"family_name\",\"phone_number\",\"sex\",\"external_id\"/)
      end
    end
  end

  describe '.column_data' do
    subject { Code.column_data(patients.flatten, 'new') }
    context 'column data for printing new results' do
      let(:day) { 1 }
      let(:patients) { Code.process_patients(day) }
      it 'is comma separated values' do
        expect(subject.length).to eq 70
        expect(subject[1].split(',').length).to eq 6
      end
    end
  end
end
