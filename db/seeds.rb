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


employee1 = unit1.employees.create!({
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
		picture: "frank_abagnale.jpg"
})

employee2 = unit1.employees.create!({
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

employee3 = unit1.employees.create!({
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

employee4 = unit2.employees.create!({
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
		picture: "placeholder.jpg"
})


job_type1 = unit1.job_types.create!({
		description: "Server",
		tipped: true
})

job_type2 = unit1.job_types.create!({
		description: "Dishwasher",
		tipped: false
})

job_type3 = unit1.job_types.create!({
		description: "Busser",
		tipped: true
})

job_type4 = unit1.job_types.create!({
		description: "Cook",
		tipped: false
})

job_type5 = unit2.job_types.create!({
		description: "Host",
		tipped: true
})


job1 = employee1.jobs.create!({
	job_type: job_type1,
	start_date: "2010-06-02",
	end_date: nil
})

job2 = employee2.jobs.create!({
	job_type: job_type2,
	start_date: "2013-07-20",
	end_date: "2014-05-11"
})

job3 = employee2.jobs.create!({
	job_type: job_type3,
	start_date: "2014-05-02",
	end_date: nil
})

job4 = employee3.jobs.create!({
	job_type: job_type4,
	start_date: "2014-07-28",
	end_date: "2015-02-13"
})

job5 = employee3.jobs.create!({
	job_type: job_type4,
	start_date: "2016-05-04",
	end_date: nil
})

job6 = employee4.jobs.create!({
	job_type: job_type5,
	start_date: "2000-08-12",
	end_date: nil
})
