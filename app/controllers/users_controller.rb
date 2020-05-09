class UsersController < ApplicationController

  before_action :authenticate_user,{only: [:index]}
  before_action :forbit_login_user,{only: [:login, :create]}

  def index
    @users = User.all

  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      image_name: "default_img.png"
    )
    if @user.save
     flash[:notice] = "ユーザー登録が完了しました"
     redirect_to("/users/index")
     session[:user_id] = @user.id
   else
     render("users/sigun_up")
   end
  end

  def login
   @user = User.find_by(
     name: params[:name],
     password: params[:password]
   )
   if @user
     session[:user_id] =@user.id
     flash[:notice] = "ログインしました"
     redirect_to("/users/index")
   else
     @error_message = "ログインできませんでした"
     render("users/login_form")
   end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
def show
  @to_user = User.find_by(id: params[:id])
  @posts = Post.where(to_user_id: @to_user)

end

def update
  @user = User.find_by(id: params[:id])
  if params[:image]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
  end
  if @user.save
    flash[:notice] = "画像を変更しました"
    redirect_to("/users/#{@user.id}")
    else
     render("users/edit")
    end
end


end
