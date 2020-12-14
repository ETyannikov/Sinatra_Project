class CreateVaccineTable < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :disease
      t.integer :patient_id
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
