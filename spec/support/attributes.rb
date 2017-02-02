def unit_attributes(overrides = {})
	{
		name: "Restaurant",
		address: "123 Restaurant Lane",
		city: "Salt Lake City",
		state: "UT",
		zip: "84124",
		slug: "restaurant"
	}.merge(overrides)
end


def employee_attributes(overrides = {})
{
	first_name: "Frank",
	middle_name: "William",
	last_name: "Abagnale",
	address1: "1234 Broadway St.",
	address2: nil,
	city: "Salt Lake City",
	state: "UT",
	zip: "84124",
	pin: "456",
	ssn: "546623587",
	birthdate: "1990-04-20",
	hire_date: "2010-06-02",
	termination_date: nil,
	phone1: "801-654-3214",
	phone2: nil,
	picture: "frank_abagnale.jpg",
	email: "frank.abagnale@example.com",
	slug: "frank-abagnale"
	
}.merge(overrides)
end

def job_type_attributes(overrides = {})
{
	description: "Server",
	tipped: true,
	slug: "server"
}.merge(overrides)
end

def job_attributes(overrides = {})
{
	start_date: "2015-04-15",
	end_date: "2016-06-22",
	employee: nil,
	job_type: nil
}.merge(overrides)
end