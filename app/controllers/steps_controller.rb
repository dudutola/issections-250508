class StepsController < ApplicationController
  before_action :set_step, only: [ :show, ]

  def index
    @sections = Section.includes(:steps)
  end

  def show; end

  def new
    @section = Section.find(params[:section_id])
    @step = @section.steps.new
  end

  def create
    @section = Section.find(params[:section_id])
    @step = @section.steps.new(steps_params)

    if @step.save
      redirect_to section_step_path(@section, @step), notice: "Step was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_step
    @section = Section.find(params[:section_id])
    @step = @section.steps.find(params[:id])
  end

  def steps_params
    params.require(:step).permit(:title, :description, :content, :section_id)
  end
end
