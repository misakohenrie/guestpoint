class JobType < ApplicationRecord
	has_many :jobs, dependent: :destroy
	has_many :employees, :through => :jobs

	

  validates :description, presence: true
  validates :tipped, :inclusion => { :in => [true, false], :message => "must be true or false" }

  def self.job_type_order
  	JobType.order(:description)
  end

end

