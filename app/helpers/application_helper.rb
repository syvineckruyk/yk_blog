# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def title
		base_title = "stevenyk.com"
		if @title.nil?
			base_title
		else
			"#{@title} // #{base_title}"	
		end
	end
end
