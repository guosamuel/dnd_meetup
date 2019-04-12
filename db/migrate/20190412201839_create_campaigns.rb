class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.boolean :completed
      t.string :title
      t.integer :expect_number_of_meetups
      t.integer :difficulty
      t.integer :max_number_of_characters

      t.timestamps
    end
  end
end
