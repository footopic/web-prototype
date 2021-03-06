class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  def create

    @comment  = Comment.new(comment_params)
    @article  = @comment.article
    @comments = @article.comments.order('created_at')

    respond_to do |format|
      if @comment.save
        SlackHook.new.post(current_user, t('.slack_message', {
            user:  @comment.user.screen_name,
            title: @article.title,
            url:   full_path(article_path(@article))
        }), @comment.text)

        format.js { render 'comments/create' }
      else
        redirect_to article_path(@comment.article), flash: { error: 'コメントが空です' }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'コメントを更新しました'
    else
      redirect_to article_path(@comment.article), notice: { error: 'コメントが空です' }
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to article_path(@comment.article), notice: 'コメントを削除しました'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text, :user_id, :article_id)
  end
end
