class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    #クライアントの要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        Rails.logger.info "[ACHIEVE_DEBUG] @comment.save true"
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました'}
        format.js { render :index }
      else
        Rails.logger.info "[ACHIEVE_DEBUG] @comment.save false"
        format.html { render :new }
      end
    end
  end

  def destroy
    Rails.logger.info "[ACHIEVE_DEBUG] CommentsController.destroy method ignited"
    #binding.pry
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
#Rails.logger.info "[ACHIEVE_DEBUG] "
