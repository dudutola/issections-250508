class StepsController < ApplicationController
  before_action :set_step, only: [ :show, ]

  def index
    @sections = Section.includes(:steps)
  end

  def show; end

  private

  def set_step
    @section = Section.find(params[:section_id])
    @step = @section.steps.find(params[:id])
  end
end
