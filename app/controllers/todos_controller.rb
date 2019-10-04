class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  def index
    @todos = Todo.all
  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todos_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @todo.update(todos_params)
      flash[:success] = "Todo was successfully updated!"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
    
  def destroy
    @todo.destroy
    flash[:success] = "Todo was deleted successully!"
    redirect_to todos_path
  end
  
  private
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todos_params
      params.require(:todo).permit(:name, :description)
    end
  
end