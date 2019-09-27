class UserMajor < ApplicationRecord
  belongs_to :user
  belongs_to :major
end
