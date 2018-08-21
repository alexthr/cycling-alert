class IssuesController < ApplicationController
  def index

  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    if @issue.save
      redirect_to issue_path(@issue)
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

  def issue_params
    params.require(:issue).permit(:title, :description, :solution,  photos: [])
  end
end
