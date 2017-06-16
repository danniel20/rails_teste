class Address < ApplicationRecord
  # Associations
  belongs_to :contact

  # Validations
	validates :street, :zip_code, :city, :state, presence: true
end
