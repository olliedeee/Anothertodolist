class TodosController < ApplicationController
  

  before_action :set_todo, only: [:edit, :update, :show, :destroy]

  def new
    @todo = Todo.new
  end
  
  def index
    @nameitanything = Todo.all
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if  @todo.save
      flash[:notice] = "todo created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'    
    end
  end
  
  def home
  end
  
  def update
    @todo = Todo.find(params[:id])
    if  @todo.update(todo_params)
      flash[:notice] = "todo updated successfully!"
      redirect_to todos_path
    else
      render 'edit'    
    end
  end
  
  def about
  end
  
  def help
  end
  
  def edit
    authorize! :update, @todo
      @todo = Todo.find(params[:id])
  end
  
  def destroy
  authorize! :destroy, @todo
  @todo = Todo.find(params[:id])
  @todo.destroy
  flash[:notice] = "Todo item deleted successfully"
  redirect_to todos_path
  end
  
  private
  
  def set_todo
   @todo = Todo.find(params[:id])

  end
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
end
