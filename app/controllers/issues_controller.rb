class IssuesController < ApplicationController
  before_action :set_issue, only: [ :show, :edit, :update, :destroy ]

  def show; end

  def new
    @section = Section.find(params[:section_id])
    @issue = @section.issues.new
  end

  def create
    @section = Section.find(params[:section_id])
    @issue = @section.issues.new(issue_params)

    if @issue.save
      assign_keywords(@issue)
      redirect_to @section, notice: "Issue was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @issue.keyword_list = @issue.keywords.pluck(:word).join(",")
  end

  def update
    if @issue.update(issue_params)
      assign_keywords(@issue)
      redirect_to section_issue_path(@section, @issue), notice: "Issue was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
    redirect_to section_path(@section), notice: "Issue was successfully deleted!"
  end

  private

  def set_issue
    @section = Section.find(params[:section_id])
    @issue = @section.issues.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :problem, :solution, :image, :solved, :section_id, :keyword_list)
  end

  def assign_keywords(issue)
    return unless issue.keyword_list.present?

    words = issue.keyword_list.split(",").map(&:strip).reject(&:blank?)
    keywords = words.map do |word|
      Keyword.find_or_create_by(word: word.downcase)
    end
    issue.keywords = keywords
  end
end
