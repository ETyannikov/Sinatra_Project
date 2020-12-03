class CreatePatientTable < ActiveRecord::Migration[6.0]
  def change
    create_table :patient do |t|
      t.string :username
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.integer :doctor_id
      
      t.timestamps null: false
    end
  end
end
