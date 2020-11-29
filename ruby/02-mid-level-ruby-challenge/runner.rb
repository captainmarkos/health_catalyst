require 'require_all'
require_all 'src'

if ARGV.length < 1
  menu = <<~MENU
  Use the application by passing an arguments for day (1-3): 'ruby runner.rb <day>'

  The records of all patients with new or changed records will be displayed for the given day:
     Example: 'ruby runner.rb 2'
  MENU
  puts menu
  exit
end

# Implement runner code below that invokes code written in the 'src' directory
# The format, output, etc. are up to you. Below is provided to ensure the files
# are being read successfully on your machine
day = ARGV[0].to_i

patients = Code.process_patients(day)
clinical_activities = Code.process_clinical_activities(day)

records = Code.collect_new(patients, day)
puts Code.column_names(records)
puts Code.column_data(records, 'new')

records = Code.collect_changed(patients, clinical_activities, day)
puts Code.column_data(records, 'changed')
