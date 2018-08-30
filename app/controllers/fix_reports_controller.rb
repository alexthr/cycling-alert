class FixReportsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    current_user.fix_reports.create(issue: @issue)
    if current_user.admin?
      @issue.update(fix_status: :resolu)
    elsif current_user.admin? == false && @issue.fix_reports.count >= 3
      @issue.update(fix_status: :resolu)
    end
    redirect_to @issue
  end

  def edit
  end

  def update
  end
end
