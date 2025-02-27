class PostsController < ApplicationController
  def show
    set_post
  end

  def edit
    set_post
  end

  def update
    set_post

    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.permit(:title, :category, :content)
  end
end
