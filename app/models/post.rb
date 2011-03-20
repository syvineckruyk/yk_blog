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
	attr_accessible(:title, :subject, :body, :body_bg_img, :image, :user_id,:image_file_name, :image_content_type, :image_file_size, :image_updated_at)
	belongs_to	:user
	has_many	:tools
	has_many	:sources
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "72x72>", :post_image_box => "281X"},
	                  :url  => "/images/assets/post_attachments/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/images/assets/post_attachments/:id/:style/:basename.:extension"
	#validates_attachment_presence :image
	#validates_attachment_size :image, :less_than => 5.megabytes
	#validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
	validates_presence_of(:title, :subject, :body)
	validates_length_of :title , :maximum => 30
	validates_length_of :subject , :maximum => 80
	acts_as_taggable
end
