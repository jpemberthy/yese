require './lib/yahoo'

describe Yahoo do
  let(:symbols) { ["GOOG", "AAPL", "C"] }

  def csv
    '
    "GOOG","Google Inc.",597.60,"+0.26%","4/23/2012"
    "AAPL","Apple Inc.",571.70,"-0.22%","4/23/2012"
    "C","Citigroup, Inc. C",33.25,"-1.89%","4/23/2012"
    '
  end

  describe ".get_stocks" do
    it "something" do
      puts csv.inspect
      Yahoo.get_stocks(symbols)
    end
  end
end
#"http://download.finance.yahoo.com/d/quotes.csv?s=AAPl&f=snl1p2d1"
