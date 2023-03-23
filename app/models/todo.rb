class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: {minimum: 2}
  validates :todo_text, length: {maximum: 50}
  def to_displayable_string
    status = completed ? '[x]' : '[ ]'
    "#{id}. #{Date.parse(due_date)} #{todo_text} #{status}"
  end

  def self.overdue
    Todo.where('due_date < ? and completed = ?', Date.today.to_s, false)
  end

  def self.due_today
    Todo.where('due_date = ?', Date.today.to_s)
  end

  def self.due_later
    Todo.where('due_date > ?', Date.today.to_s)
  end

  def self.completed
    Todo.where('completed = ?', true)
  end

  def self.of(user)
    all&.where(user_id: user.id)
  end
end
