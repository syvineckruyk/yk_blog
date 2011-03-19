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
	attr_accessible(:title, :subject, :body, :body_bg_img, :image, :user_id)
	belongs_to	:user
	has_many	:tools
	has_many	:sources
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }	
	validates_presence_of(:title, :subject, :body)
	validates_length_of :title , :maximum => 25
	validates_length_of :subject , :maximum => 80
	acts_as_taggable
end
