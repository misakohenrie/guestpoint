# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unit1 = Unit.create!({
		name: "Su Casa",
      	phone: "(801)-363-7771",
      	address: "516 E 300 S",
      	city: "Salt Lake City",
      	state: "UT",
      	zip: "84102"
})

unit2 = Unit.create!({
		name: "Fredrico's Pizza",
      	phone: "(435)-752-0130",
      	address: "1349 E 700 N",
      	city: "Logan",
      	state: "UT",
      	zip: "84321"
})


employee1 = Employee.create!({
		unit: unit1,
		first_name: "Frank",
		middle_name: "William",
		last_name: "Abagnale",
		address1: "1234 Broadway St.",
		city: "Salt Lake City",
		state: "UT",
		zip: "84124",
		pin: "456",
		ssn: "546623587",
		birthdate: "1990-04-20",
		hire_date: "2010-06-02",
		termination_date: nil,
		phone1: "(801)-654-3214",
		email: "frank.abagnale@example.com",
		password: "dicaprio",
		password_confirmation: "dicaprio",
		picture: "frank_abagnale.jpg",
		admin: true
})

employee2 = Employee.create!({
		unit: unit1,
		first_name: "Sally",
		middle_name: "Ann",
		last_name: "Smith",
		address1: "9874 Park Place",
		city: "Salt Lake City",
		state: "UT",
		zip: "84124",
		pin: "354",
		ssn: "654789321",
		birthdate: "1988-12-05",
		hire_date: "2013-07-20",
		termination_date: "2015-07-05",
		phone1: "(801)-654-1256",
		email: "sally.smith@example.com",
		password: "sweets",
		password_confirmation: "sweets",
		picture: "placeholder.jpg"
})

employee3 = Employee.create!({
		unit: unit1,
		first_name: "Jack",
		middle_name: nil,
		last_name: "Black",
		address1: "2259 St. Charles Ave",
		city: "Salt Lake City",
		state: "UT",
		zip: "84124",
		pin: "199",
		ssn: "654-48-9987",
		birthdate: "1978-06-12",
		hire_date: "2014-07-28",
		termination_date: nil,
		phone1: "(801)-456-1256",
		email: "jack.black@example.com",
		password: "nacho",
		password_confirmation: "nacho",
		picture: "jack_black.jpg"
})

employee4 = Employee.create!({
		unit: unit2,
		first_name: "Daniel",
		middle_name: nil,
		last_name: "Craig",
		address1: "2152 Bond Blvd",
		city: "Salt Lake City",
		state: "UT",
		zip: "84124",
		pin: "588",
		ssn: "251-35-2542",
		birthdate: "1957-06-26",
		hire_date: "2000-08-12",
		termination_date: nil,
		phone1: "(801)-562-4562",
		email: "daniel.craig@example.com",
		password: "bond",
		password_confirmation: "bond",
		picture: "placeholder.jpg",
		admin: true
})


job_type1 = JobType.create!({
		unit: unit1,
		description: "Server",
		tipped: true
})

job_type2 = JobType.create!({
		unit: unit1,
		description: "Dishwasher",
		tipped: false
})

job_type3 = JobType.create!({
		unit: unit1,
		description: "Busser",
		tipped: true
})

job_type4 = JobType.create!({
		unit: unit1,
		description: "Cook",
		tipped: false
})

job_type5 = JobType.create!({
		unit: unit1,
		description: "Host",
		tipped: true
})


job1 = Job.create!({
	employee: employee1,
	job_type: job_type1,
	start_date: "2010-06-02",
	end_date: nil
})

job2 = Job.create!({
	employee: employee2,
	job_type: job_type2,
	start_date: "2013-07-20",
	end_date: "2014-05-11"
})

job3 = Job.create!({
	employee: employee2,
	job_type: job_type3,
	start_date: "2014-05-02",
	end_date: nil
})

job4 = Job.create!({
	employee: employee3,
	job_type: job_type4,
	start_date: "2014-07-28",
	end_date: "2015-02-13"
})

job5 = Job.create!({
	employee: employee3,
	job_type: job_type4,
	start_date: "2016-05-04",
	end_date: nil
})

job6 = Job.create!({
	employee: employee4,
	job_type: job_type5,
	start_date: "2000-08-12",
	end_date: nil
})
