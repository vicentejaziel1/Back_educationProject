class Grade < ApplicationRecord
	belongs_to :assignment
	belongs_to :user

	before_validation :on_time?, on: :create

	def on_time?
		return if assignment.limit_date >= Date.today

    errors.add(:grade, "La fecha límite ha expirado")
	end
end
