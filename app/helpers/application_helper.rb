module ApplicationHelper

	def error_tag(model, attribute)
		if model.errors.has_key?(attribute)
			tag.div(tag.span("", :class => 'glyphicon glyphicon-remove', :'aria-hidden' => "true"))
		end
	end

end
