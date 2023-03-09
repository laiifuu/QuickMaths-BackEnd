class AddForeignKeyToReservations < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :reservations, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :reservations, :tutors, column: :tutor_id, on_delete: :cascade
  end
end
