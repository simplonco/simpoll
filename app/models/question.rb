class Question < ActiveRecord::Base
	has_many :choices
	belongs_to :poll
	accepts_nested_attributes_for :choices, :allow_destroy => true
end
