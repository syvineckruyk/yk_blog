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
	attr_accessor :name, :email
	has_many	:posts
	has_many	:tools
end
