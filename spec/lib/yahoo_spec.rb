require './lib/yahoo'

describe Yahoo do
  let(:symbols) { ["GOOG", "AAPL", "C"] }

  def csv
    File.read './spec/fixtures/stocks.csv'
  end

  describe ".get_stocks" do
    it "parses the symbols to an array of Yahoo::Stock" do
      Yahoo.stub(:get).and_return(csv)
      stocks = Yahoo.get_stocks(symbols)
      stocks.first.should be_an_instance_of Yahoo::Stock
      stocks.last.should be_an_instance_of Yahoo::Stock
      stocks.first.symbol.should == 'GOOG'
      stocks.first.price.should == 597.60
      stocks.last.symbol.should == 'C'
      stocks.last.variation.should == -1.89
    end
  end
end
#"http://download.finance.yahoo.com/d/quotes.csv?s=AAPl&f=snl1p2d1"
