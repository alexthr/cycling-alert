class DirectionsController < ApplicationController
  def show
    @issues = Issue.all
  end

  def new
    @issues = Issue.all
    @route = params[:route]
    if (@route[:start].nil? || @route[:end].nil?)
      respond_to do |format|
        format.html { redirect_to directions_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "directions/show" }
        format.js
      end
    end
  end
end

