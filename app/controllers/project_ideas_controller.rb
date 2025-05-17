class ProjectIdeasController < ApplicationController
  before_action :set_project_idea, only: [ :show, :edit, :update, :destroy, :toggle_done ]
  def index
    @project_ideas = ProjectIdea.all.order(created_at: :desc)
  end

  def show; end

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

  def edit; end

  def update
    if @project_idea.update(project_idea_params)
      redirect_to @project_idea, notice: "The idea was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project_idea.destroy
    redirect_to project_ideas_path, notice: "The idea was successfully deleted!"
  end

  def toggle_done
    @project_idea.update(done: !@project_idea.done)
    redirect_to project_ideas_path
  end

  private

  def set_project_idea
    @project_idea = ProjectIdea.find(params[:id])
  end

  def project_idea_params
    params.require(:project_idea).permit(:title, :description, :done)
  end
end
