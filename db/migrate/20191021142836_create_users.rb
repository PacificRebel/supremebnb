class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 100, unique: true
      t.timestamps
    end
  end
end
