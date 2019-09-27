class Major < ApplicationRecord
  has_many :characters, through: :character_majors, dependent: :destroy
  has_many :users, through: :user_majors, dependent: :destroy
end
