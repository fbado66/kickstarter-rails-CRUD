class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end 

    def new
        @project = Project.new
    end

    def create 
        project_params = params.require(:project).permit(:name, :description)
        @project = Project.create(project_params)

        redirect_to projects_path(@project)
    end


    def show 
        @project = Project.find(params[:id])
    end 

    def edit 
        @project = Project.find(params[:id])
    end

    def update 
        @project = Project.find(params[:id])
        project_params = params.require(:project).permit(:name, :description)
        @project.update (project_params)
        redirect_to projects_path(@project)
    end

    def destroy
        @project = Project.find(params[:id])
        Project.destroy(params[:id])
        redirect_to projects_path
    end

end
