class OwnerSubject < ApplicationRecord
	belongs_to :user, foreign_key: :owner_id
	belongs_to :subject
end
