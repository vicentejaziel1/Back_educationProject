class Professor < ApplicationRecord
	has_many :subjects
	has_one :user, as: :source
end
