class CreateDoctorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor do |t|
      t.string "username"
      t.string "password_digest"
      
      t.timestamps null: false
    end
  end
end
