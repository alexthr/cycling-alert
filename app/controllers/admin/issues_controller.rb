class Admin::IssuesController < ApplicationController

  def index
    @issues = Issue.where("city = current_user.city")

  end

end
