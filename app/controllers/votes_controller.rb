class VotesController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @vote = @issue.votes.new(direction: params[:direction])
    @vote.user = current_user
    if @vote.direction == 1
      @issue.update(vote_count: @issue.vote_count += 1)
    else
      @issue.update(vote_count: @issue.vote_count -= 1)
    end
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

  def vote_count(issue)
    @issue = Issue.find(params[:issue_id])
    sum = 0
    @issue.votes.each { |vote| sum += vote.direction }
    return sum;
  end
end
