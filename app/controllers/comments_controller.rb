class CommentsController < ApplicationController
  include CommentsHelper

  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save
    flash.notice = "Comment Posted!"

    redirect_to article_path(@comment.article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    flash.notice = "Comment Deleted!"

    redirect_to article_path(@article)
  end
end
