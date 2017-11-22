class Project < ApplicationRecord
	validates :name,		presence: true


	def begin_date
		if self.begin_year.nil? || self.begin_month.nil? then
			nil
		else
			Date.new(self.begin_year, self.begin_month, 1)
		end
	end

	def begin_date=(value)
		if value.present? then
			date = "#{value}-01".to_date
			self.begin_year = date.year
			self.begin_month = date.month
		else
			self.begin_year = nil
			self.begin_month = nil
		end
	end

	def end_date
		if self.end_year.nil? || self.end_month.nil? then
			nil
		else
			Date.new(self.end_year, self.end_month, 1)
		end
	end

	def end_date=(value)
		if value.present? then
			date = "#{value}-01".to_date
			self.end_year = date.year
			self.end_month = date.month
		else
			self.end_year = nil
			self.end_month = nil
		end
	end


	def period
		period = ""
		return if self.begin_year.nil? 
		if (self.begin_year == self.end_year) then
			period = year_to_s(self.begin_year) + ' ' + month_to_s(self.begin_month) + '〜'
			period += month_to_s(self.end_month) unless self.end_month.nil?
		else
			period = date_to_s(self.begin_year, self.begin_month) + ' 〜 '
			period += date_to_s(self.end_year, self.end_month) unless self.end_year.nil?
		end
		return period
	end

	private

	def date_to_s year, month
		year_to_s(year) + month_to_s(month)
	end

	def year_to_s year
		return " 年" if year.nil?
		"%d年" % year
	end

	def month_to_s month
		return " 月" if month.nil?
		"%d月" % month
	end


end
