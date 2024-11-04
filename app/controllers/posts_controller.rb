class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: "Publicación creada exitosamente."
    else
      render :new
    end
  end

  def edit; end
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Publicación actualizada exitosamente."
    else
      render :edit
    end
  end


  def destroy
  end

  def like
    @post = Post.find(params[:id])
    @post.increment!(:likes)
    redirect_to posts_path
  end
  def dislike
    @post.dislike
    redirect_to @post, notice: "Has dado No me gusta a esta publicación."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: "No tienes permiso para realizar esta acción."
    end
  end
end