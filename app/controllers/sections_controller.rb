class SectionsController < ApplicationController
  before_action :set_section, only: [ :show, :edit, :update, :destroy ]

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

  def edit; end

  def update
    if @section.update(section_params)
      redirect_to @section, notice: "Section was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    redirect_to root_path, notice: "Section was successfully deleted!"
  end

  private

  def set_section
    @section = Section.find(params[:id])
    @issues = @section.issues
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
