class CreateBookingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.timestamps
      t.date :date
      t.boolean :approved
    end
    add_reference :bookings, :guest, index: true
    add_foreign_key :bookings, :users, column: :guest_id
    add_reference :bookings, :space, index: true
    add_foreign_key :bookings, :spaces, column: :space_id
  end
end
