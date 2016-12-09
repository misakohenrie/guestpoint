module EmployeesHelper

	def picture_for(employee)
		if employee.picture.blank?
			image_tag("placeholder.jpg", size: "80x95")
		else
			image_tag(employee.picture, size: "80x95")
		end
	end
end
