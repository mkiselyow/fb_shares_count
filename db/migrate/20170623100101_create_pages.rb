class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.integer :site_id
      t.string :url

      t.timestamps
    end
  end
end
