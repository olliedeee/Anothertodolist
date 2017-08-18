class CommentsController < ApplicationController
  
    http_basic_authenticate_with name: "123", password: "123", only: [:destroy]

  
  def create
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.create(comment_params)
    redirect_to todo_path(@todo)
  end
  
  def destroy
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.find(params[:id])
    @comment.destroy
    redirect_to todo_path(@todo)
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
  
end
