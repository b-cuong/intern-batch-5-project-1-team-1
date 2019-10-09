class AddCharacterToResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :character, foreign_key: true
  end
end
