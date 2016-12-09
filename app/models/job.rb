class Job < ApplicationRecord
  belongs_to :employee
  belongs_to :job_type

  
  validates :start_date, presence: true

  def self.job_order

		Job.order('case when end_date is null then 0 else 1 end, end_date desc, start_date desc')
	end

	def self.active_job
		where("end_date = ?", nil)
	end
end
