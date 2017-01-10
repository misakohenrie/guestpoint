class Employee < ApplicationRecord
	before_validation :generate_slug

	has_many :jobs, dependent: :destroy
	has_many :job_types, :through => :jobs

	accepts_nested_attributes_for :job_types
	accepts_nested_attributes_for :jobs, allow_destroy: true

	validates :first_name, :last_name, :address1, :city, :state, :zip, :phone1, :ssn, :birthdate, :pin, :hire_date, presence: true
	validates :picture, allow_blank: true, format: {
  		with:    /\w+\.(gif|jpg|png)\z/i,
  		message: "must reference a GIF, JPG, or PNG image"}
  	validates :slug, uniqueness: true

	def self.employee_order
		Employee.order(hire_date: :desc, last_name: :asc)
	end

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= "#{first_name.parameterize}-#{last_name.parameterize}" if last_name
	end

end
