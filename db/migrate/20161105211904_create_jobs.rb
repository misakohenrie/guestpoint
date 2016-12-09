class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.date :start_date
      t.date :end_date
      t.references :employee, foreign_key: true
      t.references :job_type, foreign_key: true

      t.timestamps
    end
  end
end
