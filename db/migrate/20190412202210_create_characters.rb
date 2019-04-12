class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :campaign_id
      t.string :alignment
      t.string :char_name
      t.string :class
      t.string :race
      t.string :weapon
      t.integer :level

      t.timestamps
    end
  end
end
