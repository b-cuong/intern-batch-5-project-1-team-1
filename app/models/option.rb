class Option < ApplicationRecord
  has_many :results, dependent: :destroy
end
