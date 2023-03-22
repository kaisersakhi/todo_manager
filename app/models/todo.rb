class Todo < ActiveRecord::Base
  belongs_to :user
  def to_displayable_string
    status = completed ? "[x]" : "[ ]"
    "#{id}. #{Date.parse(due_date)} #{todo_text} #{status}"
  end

  def self.overdue(user_id = -1)
    p user_id
    Todo.where("due_date < ? and completed = ? and user_id = ?", Date.today.to_s, false, user_id)
  end

  def self.due_today(user_id = -1)
    Todo.where("due_date = ? and user_id = ?", Date.today.to_s, user_id)
  end

  def self.due_later(user_id = -1)
    Todo.where("due_date > ? and user_id = ?", Date.today.to_s, user_id)
  end

  def self.completed
    Todo.where("completed = ?", true)
  end


end
