class Stock < ActiveRecord::Base
  attr_accessible :close_date, :close_price, :name, :symbol, :variation
  validates_presence_of :symbol, :close_price, :variation
  validates_numericality_of :close_price, :greater_than => 0.0
  validates_numericality_of :variation
  validates_uniqueness_of :symbol
end
