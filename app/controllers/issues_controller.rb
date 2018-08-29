class IssuesController < ApplicationController
  before_action :find_issue, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # @issues = Issue.all.sort { |issue1, issue2| issue2.vote_count <=> issue1.vote_count }
    @issues = Issue.select('*, (select sum(direction) from votes where issue_id = issues.id) as total')
   .order('total, created_at desc NULLS LAST')
    if params[:query].present?
      @issues = Issue.order_by_date_or_status(query_params[:element])
    end

    # @issues = Issue.filter_by_city(params[:city]) if params[:city].present?
    # @issues = Issue.fix_status(params[:fix_status]) if params[:fix_status].present?
    # @issues = Issue.vote_count(params[:vote_count]) if params[:vote_count].present?
    # @issues = Issue.date(params[:date]) if params[:date].present?


    # @issues = Issue.order(date: :desc)
    # @issues = Issue.order(vote_count: :desc)
    # @issues = Issue.order(fix_status: :desc)

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

  def query_params
    params.require(:query).permit(:element, :city)
  end


  def issue_params
    params.require(:issue).permit(:title, :description, :solution, :address, :fix_status, :longitude, :latitude,  photos: [])
  end
end
