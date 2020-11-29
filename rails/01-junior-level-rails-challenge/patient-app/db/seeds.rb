# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

puts "BEFORE - #{Patient.count} patient records exist"
CSV.table(Rails.root.join('db', 'seed_files', 'patients.csv')).each do |row|
  record = row.to_h.merge(date_of_birth: Date.parse(row[:date_of_birth]))
  Patient.find_or_create_by!(record)
end
puts "AFTER - #{Patient.count} patient records exist"
