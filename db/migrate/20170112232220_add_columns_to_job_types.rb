class AddColumnsToJobTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :job_types, :unit_id, :integer
  end
end
