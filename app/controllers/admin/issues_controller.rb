class Admin::IssuesController < ApplicationController

  def index
    @issues = Issue.where(city: current_user.city)
    @mkers = @issues.map do |issue|
      {
        lat: issue.latitude,
        lng: issue.longitude,
        infoWindow: { content: render_to_string(partial: "/issues/map_info_window", locals: { issue: issue }) }
      }
    end
  end

end

