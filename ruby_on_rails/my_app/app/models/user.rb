class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  # after_validation { puts 2 }
  # before_validation { puts 1 }
  # after_save { puts 8 }
  # before_save { puts 3 }
  # around_save :call_around_save
  # after_create { puts 7 }
  # before_create { puts 5 }
  # around_create :call_around_create
  # after_commit { puts 9 }
  # after_rollback { puts 10 }
  # before_destroy { puts 9 }
  # around_destroy :call_around_destroy
  # after_destroy { puts 11 }
  attr_accessor :remember_token, :activation_token, :reset_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 0, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def active
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def feed
    microposts
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # def call_around_save
  #   puts "in around save"
  #   yield # Article saved
  #   puts "out around save"
  # end

  # def call_around_create
  #   puts "in around create"
  #   yield # Article saved
  #   puts "out around create"
  # end

  # def call_around_destroy
  #   puts "in around destroy"
  #   yield # Article saved
  #   puts "out around destroy"
  # end
end
