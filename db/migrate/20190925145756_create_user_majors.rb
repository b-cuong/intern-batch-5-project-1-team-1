class CreateUserMajors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_majors do |t|
      t.references :user, foreign_key: true
      t.references :major, foreign_key: true
      
      t.timestamps
    end
  end
end
