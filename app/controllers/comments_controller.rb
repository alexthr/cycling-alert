class CommentsController < ApplicationController
  before_action :find_issue

  def new
    @new_comment = Comment.new
  end

  def create
    @comment = @issue.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to issue_path(@comment.issue)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
