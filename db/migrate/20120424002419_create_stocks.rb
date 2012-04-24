class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.float :last_price
      t.float :last_variation

      t.timestamps
    end
  end
end
