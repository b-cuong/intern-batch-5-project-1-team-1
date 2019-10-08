class Question < ApplicationRecord
  belongs_to :character
  has_many :results
end
