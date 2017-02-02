require 'rails_helper'

describe "Viewing a list of job types" do

	it "shows the job types" do
		unit = Unit.create!(unit_attributes)
		job_type1= unit.job_types.create(job_type_attributes)

		job_type2= unit.job_types.create(description: "Dishwasher", tipped: false)

		visit unit_job_types_url(unit)

		expect(page).to have_text(job_type1.description)
		expect(page).to have_text(job_type2.description)
	end

end