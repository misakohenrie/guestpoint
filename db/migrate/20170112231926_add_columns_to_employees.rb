class AddColumnsToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :unit_id, :integer
    add_column :employees, :email, :string

  end
end
