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
        def facebook_like
            content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
        end
        def clickable_tag_list(tag_list)
		out = []
		tag_list.each do |tag|
			out << link_to(tag.name, tag_path(tag))
		end
		out.join(' ')
        end
end
