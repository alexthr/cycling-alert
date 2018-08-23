class VotesController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @vote = @issue.votes.new(direction: params[:direction])
    @vote.user = current_user
    if @vote.save
      redirect_to issue_path(@issue)
    else
      redirect_to issues_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
