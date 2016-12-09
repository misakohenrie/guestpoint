class Employee < ApplicationRecord
	has_many :jobs, dependent: :destroy
	has_many :job_types, :through => :jobs

	accepts_nested_attributes_for :job_types
	accepts_nested_attributes_for :jobs, allow_destroy: true

	validates :first_name, :last_name, :address1, :city, :state, :zip, :phone1, :ssn, :birthdate, :pin, :hire_date, presence: true
	validates :picture, allow_blank: true, format: {
  		with:    /\w+\.(gif|jpg|png)\z/i,
  		message: "must reference a GIF, JPG, or PNG image"}

	def self.employee_order
		Employee.order(hire_date: :desc, last_name: :asc)
	end

end
