class CreatePrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :prizes do |t|
      t.string :name, null: false
      t.integer :stock_count, default: 0, null: false
      t.belongs_to :condition
      t.timestamps
    end
  end
end
