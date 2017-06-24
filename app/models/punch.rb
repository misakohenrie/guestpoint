class Punch < ApplicationRecord
	
	belongs_to :job

	def self.active_punch
		Punch.where.not(:created_at => nil)
	end
end
