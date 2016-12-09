# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create!([
	{
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
		phone1: "801-654-3214",
		picture: "frank_abagnale.jpg"

	},
	{
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
		phone1: "801-654-1256",
		picture: "placeholder.jpg"
	}	
])

JobType.create!([
	{
		description: "Server",
		tipped: true
	},

	{
		description: "Dishwasher",
		tipped: false

	}
])


