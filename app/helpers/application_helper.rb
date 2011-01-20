# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	include TagsHelper
	def title
		base_title = "stevenyk.com"
		if @title.nil?
			base_title
		else
			"#{h(@title)}  #{base_title}"	
		end
	end
end
