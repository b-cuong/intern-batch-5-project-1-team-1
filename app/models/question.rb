class Question < ApplicationRecord
  belongs_to :character, dependent: :destroy
  has_many :results, dependent: :destroy
end
