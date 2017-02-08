require 'rails_helper'

describe "Viewing an individual job_type" do

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "shows the details of the job_type" do
		job_type = @unit.job_types.create(job_type_attributes)

		visit job_type_url(job_type)

		expect(page).to have_text(job_type.description)

	end

end