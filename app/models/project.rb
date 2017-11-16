class Project < ApplicationRecord
	def begin_date
		date = Date.new(self.begin_year, self.begin_month, 1)
		date.strftime("%Y年%m月")
	end

	def end_date
		date = Date.new(self.end_year, self.end_month, 1)
		date.strftime("%Y年%m月")
	end
end
