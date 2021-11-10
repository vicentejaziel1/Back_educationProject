class Student < ApplicationRecord
	has_one :user, as: :source
end
