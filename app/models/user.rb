class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  belongs_to :owner, polymorphic: true
  has_many :owner_subjects, foreign_key: :owner_id
  has_many :subjects, through: :owner_subjects
  has_many :grades
end
