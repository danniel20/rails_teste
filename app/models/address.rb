class Address < ApplicationRecord
  # Associations
  belongs_to :contact

  # Validations
	validates :street, :zip_code, :state, presence: true
end
