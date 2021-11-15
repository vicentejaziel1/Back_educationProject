class Professor < ApplicationRecord
	has_one :user, as: :source
	has_many :subjects
end
