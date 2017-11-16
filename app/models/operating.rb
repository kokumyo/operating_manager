class Operating < ApplicationRecord
	belongs_to :user
	belongs_to :project

	validates :time, presence: true
end
