class User < ApplicationRecord
  has_many :majors, through: :user_majors, dependent: :destroy
  has_many :results, dependent: :destroy
end
