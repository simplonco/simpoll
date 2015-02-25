class Poll < ActiveRecord::Base
  has_many :questions
end
