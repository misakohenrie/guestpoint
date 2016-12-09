require 'rails_helper'

describe "Viewing an individual job_type" do

	it "shows the details of the job_type" do
		job_type = JobType.create(job_type_attributes)

		visit job_type_url(job_type)

		expect(page).to have_text(job_type.description)

	end

end