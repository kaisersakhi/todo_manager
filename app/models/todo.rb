class Todo < ActiveRecord::Base
  def to_displayable_string
    status = completed ? "[x]" : "[ ]"
    "#{id}. #{Date.parse(due_date)} #{todo_text} #{status}"
  end

  def self.overdue
    Todo.where("due_date < ?", Date.today.to_s)
  end

  def self.due_today
    Todo.where("due_date = ?", Date.today.to_s)
  end

  def self.due_later
    Todo.where("due_date > ?", Date.today.to_s)
  end

  def self.completed
    Todo.where("completed = ?", true)
  end
end
