class Question < ActiveRecord::Base
	has_one :chapter
	has_many :answers
end
