require 'rails_helper'

RSpec.describe CustomersHelper, type: :helper do # rubocop: disable Metrics/BlockLength
  describe 'latest_import' do
    let(:partner) { create(:partner) }
    let(:customer) { create(:customer, partner: partner, name: 'Elmer') }

    context 'no customer record' do
      it 'returns nil' do
        val = helper.latest_import(nil)
        expect(val).to eq nil
      end
    end

    context 'customer with no import records' do
      it 'returns nil' do
        val = helper.latest_import(customer)
        expect(val).to eq nil
      end
    end

    context 'customer with import records' do
      let!(:imports) do
        [create(:import, customer: customer),
         create(:import, customer: customer)]
      end

      it 'returns nil' do
        val = helper.latest_import(customer)
        expect(val.present?).to eq true
      end
    end
  end

  describe 'options_for_status_select' do
    context 'select list options for import status' do
      it 'returns options with selected option' do
        res = helper.options_for_status_select('running')
        expect(res).to match(/selected="selected" value="running"/)
      end

      it 'returns options without selected option' do
        res = helper.options_for_status_select(nil)
        expect(res).not_to match(/selected="selected"/)
      end
    end
  end
end
