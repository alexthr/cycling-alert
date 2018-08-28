class IssuesController < ApplicationController
  before_action :find_issue, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # @issues = Issue.all.sort { |issue1, issue2| issue2.vote_count <=> issue1.vote_count }
    @issues = Issue.select(', (select sum(direction) from votes where issue_id = issues.id) as total')
   .order('total, created_at desc NULLS LAST')
    @issues = Issue.where(city: query_city) if query_city.present?
    @issues = Issue.order(fix_status: :desc) if query_status.present?

    @markers = @issues.map do |issue|
      {
        lat: issue.latitude,
        lng: issue.longitude,
        infoWindow: { content: render_to_string(partial: "/issues/map_info_window", locals: { issue: issue }) },
      }
    end
  end

  def show
    @comments = @issue.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    @issue.city = Geocoder.search([@issue.latitude, @issue.longitude]).first.city
    if @issue.save
      redirect_to issue_path(@issue)
    else
      render :new
    end
  end

  def edit; end

  def update
  end

  def destroy

  end



  private

  def find_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :solution, :address, :fix_status, :longitude, :latitude,  photos: [])
  end
end
