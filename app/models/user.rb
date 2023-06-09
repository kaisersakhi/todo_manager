class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  validates :first_name, presence: true
  validates :email, presence: true
  def to_s
    "#{first_name} #{last_name} | #{email}"
  end
end
