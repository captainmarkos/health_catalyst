# frozen_string_literal: true

require_relative '../src/code'
require 'tempfile'

# Change the code/filenames/whatever you want in the spec and src directories
RSpec.describe Code do
  describe '.parse_csv' do
    subject { Code.parse_csv(filepath) }

    context 'when a valid filepath is passed' do
      let(:filepath) { File.join(File.dirname(__FILE__), '../data/patients-day-1.csv') }
      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
