class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :batch

      t.timestamps
    end
  end
end
