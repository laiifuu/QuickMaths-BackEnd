class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|

      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :fb_link
      t.string :ig_link
      t.string :twitter_link
      t.string :photo_url
      t.integer :hourly_fee
      t.integer :experience
      t.integer :rating

      t.timestamps
    end

    add_index :tutors, :fb_link, unique: true
    add_index :tutors, :twitter_link, unique: true
    add_index :tutors, :ig_link, unique: true
    add_index :tutors, :photo_url, unique: true
  end
end
