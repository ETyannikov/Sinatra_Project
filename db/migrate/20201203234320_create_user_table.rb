class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :password_digest
      t.boolean :is_doctor
    
      t.timestamps null: false
    end
  end
end
