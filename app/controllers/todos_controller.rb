class TodosController < ApplicationController
  
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
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todos_params)
      flash[:success] = "Todo was successfully updated!"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
    
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:success] = "Todo was deleted successully!"
    redirect_to todos_path
  end
  
  private
    def todos_params
      params.require(:todo).permit(:name, :description)
    end
  
end