class Admin::IssuesController < ApplicationController

  def index
    @cities = Issue.cities
    @cities += ['Toutes les villes', 'Autour de moi']
    if params[:query].nil?
      @issues = Issue.where(city: current_user.city)
    elsif query_params[:city] == 'Toutes les villes'
      @issues = Issue.all
    elsif query_params[:city] == 'Autour de moi'
      @issues = Issue.near([query_params[:latitude].to_f, query_params[:longitude].to_f], 3)
    elsif query_params[:city].present?
      @issues = Issue.where(city: query_params[:city])
    else
      @issues = Issue.where(city: current_user.city)
    end

    @issues = @issues.order_by_date_or_status(query_params[:element]) if params[:query].present? && query_params[:element].present? && query_params[:element] != 'vote_count'
    @issues = @issues.order_by_vote_count if params[:query].present? && query_params[:element].present? && query_params[:element] == 'vote_count'

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

