class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.text :content
      t.integer :score

      t.timestamps
    end
  end
end
