class BugsController < ApplicationController
  require 'slack-notifier'
  before_action :authenticate_user!
  def edit
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
  end
  def create
     @project = Project.find(params[:project_id])
     @bug = @project.bugs.create(bug_params)
     name=@bug.name
     status=@bug.status
     redirect_to project_path(@project)
     notifier = Slack::Notifier.new ("https://hooks.slack.com/services/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")
     notifier.ping("Bug:"+name+" Status:"+status)
   end

   def update
     @project = Project.find(params[:project_id])
     @bug = @project.bugs.find(params[:id])
     if @bug.update(bug_params)
       name=@bug.name
       status=@bug.status
       redirect_to project_path(@project)
       notifier = Slack::Notifier.new ("https://hooks.slack.com/services/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")
       notifier.ping("Bug:"+name+" Status:"+status)
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

   def bug_params
     params.require(:bug).permit(:name, :body, :status, :project)
   end
end
