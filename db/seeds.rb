# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

{ "PRE.TO" => 28.06, "C" => 33.25, "APPL" => 571.70 }.each do |symbol, price|
  Stock.find_or_create_by_symbol(symbol, last_price: price, last_variation: 0)
end
