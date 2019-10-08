class Character < ApplicationRecord
  has_many :character_majors
  has_many :majors, through: :character_majors
  has_many :questions, dependent: :destroy
end
