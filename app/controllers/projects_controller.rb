class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @user = current_user
    @joined = @project.users.include?(@user)
    @projects_user = if @joined
                       ProjectsUsers.find_by(project_id: @project.id, user_id: @user.id)
                     else
                       ProjectsUsers.new
                     end
  end

  def new
    @project = Project.new
    @user = current_user
  end

  def create
    project = Project.new(project_params(:name, :description))
    if project.save
      redirect_to project_path(project)
    else
      redirect_to new_project_path
    end
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
  end

  def update
    project = Project.find(params[:id])
    if project.update(project_params(:name, :description))
      redirect_to project_path(project)
    else
      redirect_to edit_project_path(project)
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy
      redirect_to projects_path
    else
      redirect_to edit_project_path(project)
    end
  end

  def join
    project = Project.find(params[:id])
    user = current_user
    projects_user = ProjectsUsers.new(project_id: project.id, user_id: user.id)
    projects_user.save
    redirect_to project_path(project)
  end

  def leave
    project = Project.find(params[:id])
    user = project.users.find(current_user.id)
    project.users.delete(user)
    user.projects.delete(project)
    redirect_to project_path(project)
  end

  def new_gist
    @project = Project.find(params[:id])
    @user = @project.users.find(current_user.id)
    @gist = MyGist.new
    render 'projects/my_gists/new'
  end

  private

  def project_params(*args)
    params.require(:project).permit(*args)
  end
end
