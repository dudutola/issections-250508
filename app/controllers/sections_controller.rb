class SectionsController < ApplicationController
  before_action :set_section, only: [ :show ]

  def index
    @sections = Section.all
  end

  def show; end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to @section, notice: "Section created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
