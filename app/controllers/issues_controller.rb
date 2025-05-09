class IssuesController < ApplicationController
  before_action :set_issue, only: [ :show ]

  def show; end

  private

  def set_issue
    @section = Section.find(params[:section_id])
    @issue = @section.issues.find(params[:id])
  end
end
