# == Schema Information
# Schema version: 20100713034559
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  tag        :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
	attr_accessor :tag
	belongs_to	:post
end
