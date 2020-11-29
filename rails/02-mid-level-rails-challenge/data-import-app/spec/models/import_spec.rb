require 'rails_helper'

RSpec.describe Import, type: :model do
  describe 'Validations' do
    it 'is not valid with with missing attributes' do
      expect(Import.new).to_not be_valid
    end

    it 'is not valid with missing customer' do
      import = Import.new(identifier: '0101AF')
      expect(import).to_not be_valid
    end

    it 'is not valid with missing identifier' do
      import = Import.new(customer_id: 1)
      expect(import).to_not be_valid
    end
  end

  describe 'Associations' do
    # Using the shoulda gem we could do:
    # it { belongs_to(:customer) }
    it 'belongs to a customer' do
      import = Import.reflect_on_association(:customer)
      expect(import.macro).to eq(:belongs_to)
    end
  end
end
