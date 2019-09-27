class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.date :dob
      t.string :email
      t.string :address
      t.string :phone
      t.string :gender
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest 
      t.boolean :activated, default: :false 
      t.boolean :admin, default: :false 
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_at
      t.timestamps
    end
  end
end
