class CreatePunches < ActiveRecord::Migration[5.0]
  def change
    create_table :punches do |t|
    	t.datetime :punch_out
    	t.references :job, foreign_key: true
      	t.timestamps
    end
  end
end
