class StepsController < ApplicationController
  def index
    @sections = Section.includes(:steps)
  end
end
