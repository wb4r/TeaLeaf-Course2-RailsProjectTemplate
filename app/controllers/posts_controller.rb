class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  # we can use the before_action to redirect
  # based in some condition:
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

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
    # @post.creator = User.first # DELETE LATER!
    # @post.category_id = 1
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to post_path(@post)
    else
      render :new
    end
    # establish_category
  end

  def edit
    # binding.pry
    # establish_category
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

  def require_same_user
    if current_user != @post.creator
      flash[:error] = "You are not allowed to do that!"
      redirect_to root_path    
    end
  end

  # def establish_category
  #   pc = PostCategory.new
  #   pc.category_id = @post.category_id
  #   pc.post_id = @post.id
  #   pc.save
  # end
end


