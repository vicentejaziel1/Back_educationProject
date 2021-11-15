class Subject < ApplicationRecord
	has_many :owner_subjects
	has_many :users, through: :owner_subjects
	has_many :assignments
	belongs_to :professor
end
