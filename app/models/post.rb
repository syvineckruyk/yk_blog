class Post < ActiveRecord::Base
	belongs_to	:user
	has_many	:tools
	has_many	:sources
	has_many	:tags
end
