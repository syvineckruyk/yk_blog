# == Schema Information
# Schema version: 20100713034559
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  subject     :string(255)
#  body        :string(255)
#  body_bg_img :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Post < ActiveRecord::Base
	attr_accessible(:title, :subject, :body, :body_bg_img, :image, :user_id,:image_file_name, :image_content_type, :image_file_size, :image_updated_at, :tag_list)
	belongs_to	:user
	has_many	:tools
	has_many	:sources
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "72x60>", :post_image_box => "281X"},
	                  #:url  => "/images/assets/post_attachments/:id/:style/:basename.:extension",
	                  #:path => ":rails_root/public/images/assets/post_attachments/:id/:style/:basename.:extension"
			  :storage => :s3,
 			  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
 			  :path => "posts/attach/:attachment/:id/:style.:extension",
			  :url => "/posts/attach/:attachment/:id/:style.:extension"
	#validates_attachment_presence :image
	#validates_attachment_size :image, :less_than => 5.megabytes
	#validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
	validates_presence_of(:title, :subject, :body)
	validates_length_of :title , :maximum => 60
	validates_length_of :subject , :maximum => 200
	acts_as_taggable
 	cattr_reader :per_page
  	@@per_page = 5
end
