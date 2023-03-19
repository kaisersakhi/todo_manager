class Todo < ActiveRecord::Base
  def to_displayable_string
    status = completed ? "[x]" : "[ ]"
    "#{id}. #{Date.parse(due_date)} #{todo_text} #{status}"
  end
end
