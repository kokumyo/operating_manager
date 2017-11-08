module OperatingsHelper

	# 日付に対応するクラスを返す
	def class_for_operating_date (date)
		(date.sunday? || HolidayJp.holiday?(date)) ? "holiday" : date.saturday? ? "saturday" : ""
	end
end
