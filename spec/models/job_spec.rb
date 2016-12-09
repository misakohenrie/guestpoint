require 'rails_helper'

describe "A job" do 

	it "requires a start date" do 
		job = Job.new(start_date: "")

		job.valid?

		expect(job.errors[:start_date].any?).to eq(true)
	end
end