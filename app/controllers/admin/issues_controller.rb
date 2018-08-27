class Admin::IssuesController < ApplicationController

  def index
    @issues = Issue.where(city: current_user.city)
    @markers = @issues.map do |issue|
      {
        lat: issue.latitude,
        lng: issue.longitude,
        infoWindow: { content: render_to_string(partial: "/issues/map_info_window", locals: { issue: issue }) },
        # picture: {
        # "url": view_context.image_path("logo.png"),
        # "width":  50,
        # "height": 45 }
      }
    end
  end

end

