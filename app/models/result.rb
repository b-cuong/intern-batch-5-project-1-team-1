class Result < ApplicationRecord
  belongs_to :user
  belongs_to :question, dependent: :destroy
  belongs_to :option, dependent: :destroy
end
