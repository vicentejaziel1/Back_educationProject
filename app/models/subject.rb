class Subject < ApplicationRecord
	has_many :owner_subjects
	has_many :users, through: :owner_subjects
	has_many :assignments
	belongs_to :professor

	after_create :relate_professor

	def relate_professor
		owner_subjects.create(owner_id: professor.id, subject_id: self.id)
	end
end
