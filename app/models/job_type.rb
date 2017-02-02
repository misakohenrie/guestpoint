class JobType < ApplicationRecord
	before_validation :generate_slug
	
	belongs_to :unit

	has_many :jobs, dependent: :destroy
	has_many :employees, :through => :jobs


	validates :description, presence: true, uniqueness: true
	validates :tipped, :inclusion => { :in => [true, false], :message => "must be true or false" }
	validates :slug, uniqueness: true

	def self.job_type_order
		JobType.order(:description)
	end

  	def to_param
  		slug
  	end

  	def generate_slug
  		self.slug ||= description.parameterize if description
  	end

end

