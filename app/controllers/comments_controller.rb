class CommentsController < ApplicationController
  def destroy
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    # Asignar user_id como 0 si es anónimo
    @comment.user_id = comment_params[:anonymous] == "true" ? nil : current_user.id

    if @comment.save
      redirect_to @post, notice: "Comentario creado exitosamente."
    else
      render "posts/show"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :anonymous)
  end
end
