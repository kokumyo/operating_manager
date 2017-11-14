class User < ApplicationRecord
	belongs_to :role

	def group_and_name
		self.group + '／' + self.name
	end
end
