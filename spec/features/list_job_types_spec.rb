require 'rails_helper'

describe "Viewing a list of job types" do

	it "shows the job types" do
		job_type1= JobType.create(job_type_attributes)

		job_type2= JobType.create(description: "Dishwasher", tipped: false)

		visit job_types_url

		expect(page).to have_text(job_type1.description)
		expect(page).to have_text(job_type2.description)
	end

end