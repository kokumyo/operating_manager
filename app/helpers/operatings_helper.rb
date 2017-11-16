module OperatingsHelper

	# 日付に対応する曜日クラスを返す
	def class_for_operating_date (date)
		dow_class = ""
		if (date.sunday? || HolidayJp.holiday?(date)) then
			dow_class = "holiday"
		elsif date.saturday?
			dow_class = "saturday"
		end
	end

	# 時刻の出力フォーマットを整える
	def adjust_time time
		adjust_time = "" 
		adjust_time = "%g" % time unless time.nil?
	end

	# 他ユーザーの稼働実績を閲覧できる権限があるならtrue
	def all_operatings_available?
		true
	end

end
