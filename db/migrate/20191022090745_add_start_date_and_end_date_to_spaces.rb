class AddStartDateAndEndDateToSpaces < ActiveRecord::Migration[6.0]
  def change
    change_table :spaces do |t|
      t.column :start_date, :date
      t.column :end_date, :date
    end
  end
end
