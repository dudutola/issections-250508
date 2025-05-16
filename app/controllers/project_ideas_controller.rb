class ProjectIdeasController < ApplicationController
  def index
    @project_ideas = ProjectIdea.all.order(created_at: :desc)
  end
end
