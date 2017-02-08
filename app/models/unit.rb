class Unit < ApplicationRecord
	before_validation :generate_slug

	has_many :employees, dependent: :destroy
	has_many :job_types, dependent: :destroy

	validates :name, presence: true
	validates :slug, uniqueness: true

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end

	
end
