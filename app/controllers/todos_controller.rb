class TodosController < ApplicationController
  def index
    @todos = Todo.where(user_id: session[:user_id])
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = User.find(session[:user_id])

    @todo.save

    redirect_to :todos
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end
end
