require './lib/yahoo/stock'

describe Yahoo::Stock do
  let(:row)   { ["AAPL", "Apple Inc.", "571.70", "-0.22%", "4/23/2012"] }
  let(:stock) { Yahoo::Stock.new(row) }

  describe "initialization" do
    it "parse the csv row and assigns attributes" do
      stock.symbol.should == "AAPL"
      stock.name.should == "Apple Inc."
    end
  end

  it "exposes the price as a float" do
    stock.price.should be_an_instance_of Float
    stock.price.should == 571.70
  end

  it "exposes the variation as float" do
    stock.variation.should be_an_instance_of Float
    stock.variation.should == -0.22
  end

  it "exposes the date as date" do
    stock.date.should be_an_instance_of Date
    stock.date.day == 23
    stock.date.month == 4
    stock.date.year == 2012
  end
end
#"http://download.finance.yahoo.com/d/quotes.csv?s=AAPl&f=snl1p2d1"
