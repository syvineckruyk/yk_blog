# == Schema Information
# Schema version: 20100713034559
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	attr_accessor :password
	attr_accessible(:name, :email, :password, :password_confirmation)
	has_many	:posts
	has_many	:tools
	validates_presence_of(:name, :email)
	validates_length_of :name , :maximum => 50
	validates_format_of :email, :with => EmailRegex
	validates_uniqueness_of :email, :case_sensitive => false
	validates_confirmation_of :password
	validates_presence_of 	:password
	validates_length_of 	:password, :within => 6..40
end
