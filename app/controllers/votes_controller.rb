class VotesController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @vote = @issue.votes.new(direction: params[:direction])
    @vote.user = current_user
    if @vote.save
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
end