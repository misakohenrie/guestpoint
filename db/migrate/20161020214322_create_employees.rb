class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :pin
      t.string :ssn 
      t.date :birthdate
      t.date :hire_date
      t.date :termination_date
      t.string :phone1
      t.string :phone2
      t.string :picture, default: ""

      t.timestamps
    end
  end
end
