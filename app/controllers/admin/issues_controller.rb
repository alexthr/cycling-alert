class Admin::IssuesController < ApplicationController

  def index
    # @issues = Issue.all
    @cities = Issue.cities
    @cities += ['Toutes les villes', 'Autour de moi']
   #  Issue.select('*, (select sum(direction) from votes where issue_id = issues.id) as total')
   # .order('total, created_at desc NULLS LAST')
    if params[:query].nil?
      @issues = Issue.where(city: current_user.city)
    elsif query_params[:city] == 'Toutes les villes'
      @issues = Issue.all
    elsif query_params[:city] == 'Autour de moi'
      @issues = Issue.near([query_params[:latitude].to_f, query_params[:longitude].to_f], 3)
    elsif query_params[:city].present?
      @issues = Issue.where(city: query_params[:city])
    else
      @issues = Issue.all
    end

    @issues = @issues.order_by_date_or_status(query_params[:element]) if params[:query].present? && query_params[:element] != 'vote_count' && query_params[:element].present?

    @mkers = @issues.map do |issue|
      {
        lat: issue.latitude,
        lng: issue.longitude,
        infoWindow: { content: render_to_string(partial: "/issues/map_info_window", locals: { issue: issue }) }
      }
    end
  end

  private

  def query_params
    params.require(:query).permit(:element, :city, :latitude, :longitude)
  end

end

