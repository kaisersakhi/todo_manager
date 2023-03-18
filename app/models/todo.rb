class Todo < ActiveRecord::Base
  def to_displayable_string
    status = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s} #{todo_text} #{status}"
  end
end
