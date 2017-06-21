class Address < ApplicationRecord
  # Associations
  belongs_to :contact

  # Validations
	validates :street, :zip_code, :state, :city, presence: true
end
