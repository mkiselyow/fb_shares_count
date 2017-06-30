class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.integer :page_id
      t.date :date
      t.integer :shares

      t.timestamps
    end
  end
end
