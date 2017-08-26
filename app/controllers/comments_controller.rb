class CommentsController < ApplicationController
  
  def create
    @user = current_user
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to todo_path(@todo)
  end
  
   def update
    authorize! :update, @comment
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.find(params[:id])
    if  @comment.update(comment_params)
      flash[:notice] = "comment updated successfully!"
      redirect_to todo_path(@todo)
    else
      render 'edit'    
    end
   end
  
  def destroy
    authorize! :destroy, @comment
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.find(params[:id])
    @comment.destroy
    redirect_to todo_path(@todo)
  end
  
  def edit
    authorize! :update, @comment
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.find(params[:id])
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
  
end
