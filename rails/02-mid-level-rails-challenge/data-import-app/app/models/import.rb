class Import < ApplicationRecord
  belongs_to :customer

  validates :identifier, presence: true
  validates_associated :customer
end
