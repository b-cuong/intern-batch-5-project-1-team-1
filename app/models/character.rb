class Character < ApplicationRecord
  has_many :majors, through: :character_majors, dependent: :destroy
  has_many :questions, dependent: :destroy
end
