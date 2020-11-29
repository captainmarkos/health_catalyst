class Customer < ApplicationRecord
  belongs_to :partner
  has_many :imports

  validates :name, presence: true

  scope :by_import_status, lambda { |status|
    if status.present?
      includes(:imports)
        .where(imports: { status: status })
    end
  }
end
