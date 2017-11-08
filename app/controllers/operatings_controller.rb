class OperatingsController < ApplicationController

	def show
		@date = Date.today
		@operating = Operating.new
		@operatings = Operating.all.order(:day, :num)
		@projects = Project.all.order(:order)
	end

	def create
		Operating.transaction do

			Operating.where(year: params[:year]).where(month: params[:month]).delete_all
			
			params[:operating].each do |i, operatings_per_day|
				num = 0
				operatings_per_day.each do |j, operating|
					@operating = Operating.new(operating_params(operating))
					next if @operating.project_id.nil?
					@operating.num = num
					@operating.save!
					num += 1
				end
			end
		end
#		@operating = Operating.new(params[:operating]['0']['0'])

#		render plain: 'パラメータ：' + params[:operating]['0']['0'].inspect
		render 'operatings/sample'
	end

	private

	def operating_params parameter
		parameter.permit(:year, :month, :day, :project_id, :time, :summary)
	end 
end
