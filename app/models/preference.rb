class Preference < ApplicationRecord
	# Associations
  has_and_belongs_to_many :contacts
end
