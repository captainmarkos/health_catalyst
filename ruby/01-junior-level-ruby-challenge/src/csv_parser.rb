# frozen_string_literal: true

require 'csv'
require 'pry'

module CSVParser
  def self.header_row(filepath)
    CSV.parse(File.new(filepath).each_line.first).first.map(&:downcase)
  end
end
