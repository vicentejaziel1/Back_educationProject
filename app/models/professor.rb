class Professor < ApplicationRecord
	has_one :user, as: :source
end
