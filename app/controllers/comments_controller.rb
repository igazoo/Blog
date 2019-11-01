class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
   def show
    @comment = Comment.find_by(id: params[:id])
   end
    
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path, success:"投稿しました"
    else
      flash.now[:danger]="投稿できませんでした"
      render :new
    end
  end
 
  def destroy
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
        
      redirect_to comments_path ,success: "投稿を削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:title,:content,)
  end
end
