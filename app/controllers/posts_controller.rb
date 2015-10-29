class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first # DELETE LATER!
    # @post.category_id = 1
    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to post_path(@post)
    else
      render :new
    end
    # establish_category
  end

  def edit
    establish_category
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated"
      # check_and_fix_url(params[:post][:url])
      # binding.pry
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])    
  end

  # def establish_category
  #   pc = PostCategory.new
  #   pc.category_id = @post.category_id
  #   pc.post_id = @post.id
  #   pc.save
  # end
end


