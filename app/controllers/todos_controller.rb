class TodosController < ApplicationController
  self.skip_before_action(:verify_authenticity_token)

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_displayable_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = Date.parse(params[:due_date].to_s)

    p params

    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    # response_text = "Hey, your new todo is created with the id:#{new_todo.id}"
    redirect_to todos_path
  end

  #PATCH/PUT  /todos/:id
  def update
    id = params[:id]
    status = params[:status]

    todo = Todo.find(id)
    todo.completed = status
    todo.save!
    # render plain: "The status of the todo '#{todo.todo_text}' has been updated to #{status}"
    redirect_to todos_path
  end
end
