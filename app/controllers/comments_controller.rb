class CommentsController < ApplicationController
  before_action :find_issue, only: [:new, :create];

  def new
    @new_comment = Comment.new
  end

  def create
    @comment = @issue.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to issue_path(@issue) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "issues/show" }
        format.js
      end
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # redirect_to issue_path(@comment.issue)
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
