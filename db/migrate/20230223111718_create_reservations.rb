class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :tutor_id
      t.string :city
      t.date :date
      t.string :hour

      t.timestamps
    end

    add_index :reservations, [:tutor_id, :date], unique: true
  end
end
