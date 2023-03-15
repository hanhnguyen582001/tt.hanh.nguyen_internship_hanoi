class User < ApplicationRecord
  before_save { self.email = email.downcase }
  after_validation { puts 2 }
  before_validation { puts 1 }
  after_save { puts 8 }
  before_save { puts 3 }
  around_save :call_around_save
  after_create { puts 7 }
  before_create { puts 5 }
  around_create :call_around_create
  after_commit { puts 9 }
  after_rollback { puts 10 }
  before_destroy { puts 9 }
  around_destroy :call_around_destroy
  after_destroy { puts 11 }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 0, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

  def call_around_save
    puts "in around save"
    yield # Article saved
    puts "out around save"
  end

  def call_around_create
    puts "in around create"
    yield # Article saved
    puts "out around create"
  end

  def call_around_destroy
    puts "in around destroy"
    yield # Article saved
    puts "out around destroy"
  end
end
