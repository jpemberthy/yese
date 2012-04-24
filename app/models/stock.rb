class Stock < ActiveRecord::Base
  attr_accessible :last_price, :last_variation, :name, :symbol

  validates_presence_of :symbol, :last_price, :last_variation
  validates_numericality_of :last_price, :greater_than => 0.0
  validates_numericality_of :last_variation
end
