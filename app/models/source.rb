# == Schema Information
# Schema version: 20100713034559
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Source < ActiveRecord::Base
	attr_accessible(:title, :url)
	belongs_to	:post
	validates_presence_of :title
	validates_length_of :title , :maximum => 50
end
