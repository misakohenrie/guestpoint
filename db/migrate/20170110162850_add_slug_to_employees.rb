class AddSlugToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :slug, :string
  end
end
