class DirectionsController < ApplicationController
  def show
    @issues = Issue.all
  end

  def new
  end
end
