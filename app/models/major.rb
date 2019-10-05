class Major < ApplicationRecord
  has_many :character_majors
  has_many :characters, through: :character_majors
  has_many :users, through: :user_majors, dependent: :destroy
end
