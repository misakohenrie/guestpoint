class AddSlugToJobTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :job_types, :slug, :string
  end
end
