class IssuesController < ApplicationController
  before_action :find_issue, only: [:show, :edit, :update, :destroy]

  def index
    # @issues = Issue.all
    @issues = Issue.where.not(latitude: nil, longitude: nil)
    @markers = @issues.map do |issue|
      {
        lat: issue.latitude,
        lng: issue.longitude,
      }
    end
  end

  def show
    @comments = @issue.comments
    @comment = Comment.new
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

  def find_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :solution,  photos: [])
  end
end
