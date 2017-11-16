class ProjectsController < ApplicationController
	def show
		@user = User.find(1)
#		@form = Form::ProjectCollection.new

		@projects = Project.all.order(:order)
	end
end
