class TodosController < ApplicationController
  
  
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
      @todo = Todo.find(params[:id])

  end
  
  
  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
end
