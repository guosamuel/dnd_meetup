class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.integer :campaign_id
      t.string :location
      t.datetime :meet_time
      t.integer :number_of_hours

      t.timestamps
    end
  end
end
