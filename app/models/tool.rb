# == Schema Information
# Schema version: 20100713034559
#
# Table name: tools
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  developer   :string(255)
#  description :string(255)
#  rating      :string(255)
#  url         :string(255)
#  user_id     :integer
#  post_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Tool < ActiveRecord::Base
    attr_accessible(:name, :developer, :description, :rating, :url)
	belongs_to	:user
	belongs_to	:post
	validates_presence_of(:name, :developer, :url)
	validates_length_of :name , :maximum => 50
	
end
