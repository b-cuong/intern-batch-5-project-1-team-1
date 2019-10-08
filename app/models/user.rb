class User < ApplicationRecord
  has_many :majors, through: :user_majors, dependent: :destroy
  has_many :results, dependent: :destroy

  attr_accessor :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :full_name, presence: true, length: { maximum: 50 }
  has_secure_password

  before_save :downcase_email

  def self.digest string
    cost = if string
             ActiveModel::SecurePassword.min_cost
           else BCrypt::Engine::MIN_COST :BCrypt::Engine.cost
           end
    BCrypt::Password.create string, cost: cost
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
