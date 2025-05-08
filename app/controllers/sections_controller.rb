class SectionsController < ApplicationController
  before_action :set_section, only: [ :show ]

  def index
    @sections = Section.all
  end

  def show; end

  private

  def set_section
    @section = Section.find(params[:id])
  end
end
