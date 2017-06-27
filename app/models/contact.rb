class Contact < ApplicationRecord	
	# Enums
	enum gender: {:male => 0, :female => 1}

	# Associations
	has_and_belongs_to_many :preferences
	
	has_one :address, validate: true, dependent: :destroy
	accepts_nested_attributes_for :address

	has_many :phones, dependent: :destroy
	accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

	# paperclip
	has_attached_file :picture, styles: {large: "200x200>", medium: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	# Validations
	validates :name, :email, :birth_date, :gender, presence: true
end
