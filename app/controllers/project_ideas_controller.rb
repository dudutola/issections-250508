class ProjectIdeasController < ApplicationController
  def index
    @project_ideas = ProjectIdea.all.order(created_at: :desc)
  end

  def new
    @project_idea = ProjectIdea.new
  end

  def create
    @project_idea = ProjectIdea.new(project_idea_params)

    if @project_idea.save
      redirect_to project_ideas_path, notice: "project_ideas created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_idea_params
    params.require(:project_idea).permit(:title, :description, :done)
  end
end
