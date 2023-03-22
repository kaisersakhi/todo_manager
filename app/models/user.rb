class User < ActiveRecord::Base
  has_many :todos
  def to_s
    "#{name} | #{email}"
  end
end
