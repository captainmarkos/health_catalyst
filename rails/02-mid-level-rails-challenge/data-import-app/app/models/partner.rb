class Partner < ApplicationRecord
  has_many :customers

  validates :name, presence: true
end
