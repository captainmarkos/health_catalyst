# frozen_string_literal: true

require 'pry'
require 'csv'

# Change the code/filenames/whatever you want in the spec and src directories
module Code
  def self.parse_csv(filepath)
    CSV.read(filepath)
  end
end
