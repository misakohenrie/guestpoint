class Job < ApplicationRecord
  belongs_to :employee
  belongs_to :job_type
  has_many :punches, dependent: :destroy

  
  validates :start_date, presence: true

  	def job_description
  		"#{job_type.description}"
  	end

 	def self.job_order

		Job.order('case when end_date is null then 0 else 1 end, end_date desc, start_date desc')
	end

	scope :active_job, -> (end_date) { where(Job.end_date.eq(nil)) }
	
end
