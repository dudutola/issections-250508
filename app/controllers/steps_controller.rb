class StepsController < ApplicationController
  before_action :set_step, only: [ :show, :edit, :update, :destroy ]

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

  def edit; end

  def update
    if @step.update(steps_params)
      redirect_to section_step_path(@section, @step), notice: "Step was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @step.destroy
    redirect_to steps_path, notice: "Step was successfully deleted!"
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
