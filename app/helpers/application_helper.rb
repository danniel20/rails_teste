module ApplicationHelper

	def error_tag(model, attribute)
		if model.errors.has_key?(attribute)
			#content_tag(:div, model.errors[attribute].first, :class => 'text-danger')
			content_tag(:div, content_tag(:span, "",:class => 'glyphicon glyphicon-remove', :'aria-hidden' => "true"))
		end
	end

end
