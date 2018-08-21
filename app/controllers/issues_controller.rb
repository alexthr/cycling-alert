class IssuesController < ApplicationController
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

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
