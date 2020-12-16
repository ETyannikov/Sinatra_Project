class CreatePatientTable < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :user_id
      t.string :full_name
      t.string :DOB
      t.string :gender
      
      t.timestamps null: false
    end
  end
end
