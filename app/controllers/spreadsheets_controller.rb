class SpreadsheetsController < ApplicationController
	def show
		@user = User.find(params[:id])
		@users = User.all
		
		@date = get_date_param

		@operatings = Operating.select('user_id, year, month, project_id, SUM(time) AS sum_time').group(
			:user_id, :year, :month, :project_id).having(user_id: params[:id], year: @date.year, month: @date.month)

		@total = @operatings.inject(0) {|result, v| result + v.sum_time }
	end
end
