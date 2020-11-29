# frozen_string_literal: true

require_relative '../src/csv_parser'
require 'tempfile'

RSpec.describe CSVParser do
  let(:csv_file) { Tempfile.new.tap { |f| f.write(csv_contents) }.tap(&:rewind) }
  let(:filepath) { csv_file.path }

  describe '.header_row' do
    subject { described_class.header_row(filepath) }

    context 'when the csv file has data' do
      let(:csv_contents) { "firstHeader,secondHeader\nfirstValue,secondValue" }
      it { is_expected.to eq %w[firstheader secondheader] }
    end

    context 'when the csv file only has headers' do
      let(:csv_contents) { "firstHeader,secondHeader\n" }
      it { is_expected.to eq %w[firstheader secondheader] }
    end
  end
end
