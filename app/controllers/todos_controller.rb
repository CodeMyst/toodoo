# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    @todos = Todo.where(user_id: session[:user_id]).order(:completed, created_at: :desc)
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = User.find(session[:user_id])
    @todo.save

    redirect_to :todos
  end

  def get
    render inline: "<turbo-frame id='8'>asdds</turbo-frame>"
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to :todos
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed
    @todo.save

    render partial: 'todos/todo', locals: { todo: @todo }
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end
end
