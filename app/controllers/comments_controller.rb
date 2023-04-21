class CommentsController < ApplicationController
  def create
    @article = article_detail
    comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @article = article_detail
    @comment = @article.comments.find(params[:id])
  end
  
  def update
    @article = article_detail
    comment = @article.comments.find(params[:id])
    if comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit, status: 422
    end
  end

  def destroy
    @article = article_detail
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :commentable_type, :commentable_id)
  end

  def article_detail
    Article.find(params[:article_id])
  end
end