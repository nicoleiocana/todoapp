class TodosController < ApplicationController
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todos_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      flash.now[:danger] = "Error occurred!"
      render 'new'
    end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  private
    def todos_params
      params.require(:todo).permit(:name, :description)
    end
  
end