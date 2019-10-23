class AddUserIdToSpaces < ActiveRecord::Migration[6.0]
  def change
  end
  add_reference :spaces, :host, index: true
  add_foreign_key :spaces, :users, column: :host_id
end
