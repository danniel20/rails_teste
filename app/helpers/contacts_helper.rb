module ContactsHelper
	OptionsForGenders = Struct.new(:id, :description)

	def options_for_genders
		Contact.genders_i18n.map do |key, value|
			OptionsForGenders.new(key, value)
		end	
	end

end
