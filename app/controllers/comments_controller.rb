class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit!)
    @comment.post = @post 
    @comment.creator = current_user
    # @comment = @post.comments.build(params.require(:comment).permit!)
    # @comment.creator = User.first # DELETE LATER!

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render '/posts/show'
    end
  end
end