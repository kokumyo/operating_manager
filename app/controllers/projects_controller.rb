class ProjectsController < ApplicationController
	before_action :set_project, only: [ :edit, :update, :destroy, :replace ]
	before_action :set_projects, only: [ :index ]

	def index
		@project_id = flash[:project_id]
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		# ソート順をデータベース中のorderの最大値+1に設定
		order = Project.maximum(:order)
		if order.nil?
			@project.order = 0
		else
			@project.order = order + 1
		end

		if @project.save
			redirect_to action: :index
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @project.update_attributes(project_params)
			redirect_to action: :index
		else
			render :edit
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_url
	end

	def replace
		tmp_order = @project.order
		replaced_project = Project.find(params[:replaced_id])
		Project.transaction do
			@project.order = replaced_project.order
			@project.save!
			replaced_project.order = tmp_order
			replaced_project.save!
		end
		flash[:project_id] = params[:id]
		redirect_to action: :index
		rescue => e
		render plain: e.message
	end

	def replace_all
		projects = params[:projects]
		Project.transaction do
			order = 0
			projects.each do |id|
				project = Project.find(id)
				project.order = order
				project.save!
				order += 1
			end
		end
		flash[:project_id] = params[:project_id]
		redirect_to action: :index
		rescue => e
		render plain: e.message
	end

	private

		def project_params
			params.require(:project).permit(:name, :period_flag, :begin_date, :end_date, :flag)
		end

		def set_project
			@project = Project.find(params[:id])
		end

		def set_projects
			@projects = Project.all.order(:order)
		end
end
