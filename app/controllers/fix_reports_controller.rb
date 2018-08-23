class FixReportsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    current_user.fix_reports.create(issue: @issue)
    @issue.update(fix_status: "resolved") if @issue.fix_reports.count >= 3
    redirect_to @issue
  end

  def edit
  end

  def update
  end
end
