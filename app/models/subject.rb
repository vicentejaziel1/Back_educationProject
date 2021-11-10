class Subject < ApplicationRecord
	belongs_to :professor
	has_many :assignments
end
