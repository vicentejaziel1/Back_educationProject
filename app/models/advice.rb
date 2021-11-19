class Advice < ApplicationRecord
    belongs_to :user, through: :created_by_id
end
