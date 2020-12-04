class CreateDoctorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor do |t|
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end