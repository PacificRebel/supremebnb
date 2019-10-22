class CreateBookingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      # add_foreign_key :bookings, :spaces
      t.references :spaces, foreign_key: { to_table: :bookings }, index: true
      t.timestamps
      t.date :date
      t.boolean :approved
    end
    add_reference :bookings, :guest, index: true
    add_foreign_key :bookings, :users, column: :guest_id
  end
end
