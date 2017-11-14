class OperatingsController < ApplicationController

	def show

		@user = User.find(params[:id])
		@users = User.all
		@date = get_date_param

		@operatings = Operating.where(user_id: @user.id, year: @date.year, month: @date.month).order(:day, :num)
		@projects = Project.all.order(:order)

#		render 'operatings/edit'
	end

	def edit
		@user = User.find(params[:id])
		@date = get_date_param

		@operatings = Operating.where(user_id: @user.id, year: @date.year, month: @date.month).order(:day, :num)
		@projects = Project.all.order(:order)
	end

	def update
		user_id = params[:id]
		Operating.transaction do

			Operating.where(year: params[:year]).where(month: params[:month]).delete_all
			
			params[:operating].each do |i, operatings_per_day|
				num = 0
				operatings_per_day.each do |j, operating|
					@operating = Operating.new(operating_params(operating))
					next if @operating.project_id.nil?
					@operating.user_id = user_id
					@operating.num = num
					@operating.save!
					num += 1
				end
			end
		end
		redirect_to action: :show
		rescue ActiveRecord::RecordInvalid => invalid
		render plain: invalid.record.errors.full_messages
		rescue => e
		render plain: e.message
	end

	private

	def operating_params parameter
		parameter.permit(:year, :month, :day, :project_id, :time, :summary)
	end 
end
