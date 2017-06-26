class Contact < ApplicationRecord	
	# Enums
	enum gender: {:male => 0, :female => 1}

	# Associations
	has_and_belongs_to_many :preferences
	
	has_one :address, validate: true, dependent: :destroy
	accepts_nested_attributes_for :address

	has_many :phones
	accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true	
	
	# Validations
	validates :name, :email, :birth_date, :gender, presence: true
end
