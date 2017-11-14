class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_date_param
  	if params.include?(:year) && params.include?(:month) then
		year = params[:year].to_i
		month = params[:month].to_i
		return Date.new(year, month, 1)
	else
		return Date.today
	end
  end
end
