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
puts "Working on #{ARGV}";
puts Code.parse_csv(File.join(File.dirname(__FILE__), 'data/patients-day-1.csv')).first(5).map(&:to_s)
