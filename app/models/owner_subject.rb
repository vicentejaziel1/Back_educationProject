class OwnerSubject < ApplicationRecord
	belongs_to :user
	belongs_to :subject
end
