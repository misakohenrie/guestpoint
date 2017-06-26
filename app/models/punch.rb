class Punch < ApplicationRecord
	
	belongs_to :job

	def self.active_punch
		Punch.where(:punch_out => nil).where.not(:punch_in => nil)
	end
end
