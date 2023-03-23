# frozen_string_literal: true
class TodosController < ApplicationController
  # self.skip_before_action(:verify_authenticity_token)
  protect_from_forgery

  def index
    @todos = current_user.todos
    if current_user
      render 'index', locals: { current_user: current_user }
    else
      redirect_to '/'
    end
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date].to_s

    new_todo = Todo.new(
      todo_text:, # omitted the hash value, based on Rubocop recommendation
      due_date:,
      completed: false,
      user_id: @current_user.id
    )
    flash[:error] = new_todo.errors.full_messages.join(' ') unless new_todo.save
    redirect_to todos_path
  end

  # PATCH/PUT  /todos/:id
  def update
    id = params[:id]
    status = params[:status]

    todo = current_user.todos.find(id)
    todo.completed = status
    todo.save!
    # render plain: "The status of the todo '#{todo.todo_text}' has been updated to #{status}"
    redirect_to todos_path
  end

  def destroy
    todo = current_user.todos.find(params[:id])
    todo.destroy!
    redirect_to todos_path
  end
end
