class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

    private 
  
  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end

end