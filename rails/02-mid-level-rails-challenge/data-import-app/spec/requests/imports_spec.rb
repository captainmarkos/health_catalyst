require 'rails_helper'

RSpec.describe 'Imports', type: :request do
  describe 'GET #index' do
    let(:partner) { create(:partner) }
    let(:customer1) { create(:customer, partner: partner, name: 'Bugs Bunny') }
    let(:customer2) { create(:customer, partner: partner, name: 'Elmer Fudd') }
    let!(:imports) do
      [create(:import, customer: customer1),
       create(:import, customer: customer1),
       create(:import, customer: customer2)]
    end

    it 'is successful with 200 status' do
      get imports_path
      expect(response).to have_http_status(200)
    end

    it 'contains import records' do
      get imports_path
      expect(response.body).to include(customer1.name)
      expect(response.body).to include(customer2.name)

      trs = response.body.scan(/<tr>/)
      expect(trs.length).to eq 4
    end
  end
end
