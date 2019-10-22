class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.integer :price
      t.string :name
      t.string :description
    end
  end
end
