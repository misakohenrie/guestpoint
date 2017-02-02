require 'rails_helper'

describe "Viewing an individual job_type" do

	it "shows the details of the job_type" do
		unit = Unit.create!(unit_attributes)
		job_type = unit.job_types.create(job_type_attributes)

		visit unit_job_type_url(unit,job_type)

		expect(page).to have_text(job_type.description)

	end

end