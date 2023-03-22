class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  def to_s
    "#{name} | #{email}"
  end
end
