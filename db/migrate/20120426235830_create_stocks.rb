class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.float :close_price
      t.float :variation
      t.date :close_date

      t.timestamps
    end
  end
end
