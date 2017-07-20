class BugsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
  end
  def create
     @project = Project.find(params[:project_id])
     @bug = @project.bugs.create(bug_params)
     redirect_to project_path(@project)
   end

   def update
     @project = Project.find(params[:project_id])
     @bug = @project.bugs.find(params[:id])
     if @bug.update(bug_params)
       redirect_to project_path(@project)
     else
       render 'edit'
     end
   end

   def destroy
       @project = Project.find(params[:project_id])
       @bug = @project.bugs.find(params[:id])
       @bug.destroy
       redirect_to project_path(@project)
     end
   private
   def set_project
     @project = Project.find(params[:id])
   end

   def bug_params
     params.require(:bug).permit(:name, :body, :status, :project)
   end
end
