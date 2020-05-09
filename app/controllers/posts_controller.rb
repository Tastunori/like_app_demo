class PostsController < ApplicationController

  def new
     @to_user = User.find_by(id: params[:id])
     @posts = Post.where(to_user_id: @to_user)


  end

  def create
    @to_user = User.find_by(id: params[:id])
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      to_user_id: @to_user.id
    )
    if @post.save
      redirect_to("/posts/#{params[:id]}")
    else
      redirect_to("/login")
    end
  end

end
