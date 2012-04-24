require 'httparty'
require 'csv'
module Yahoo
  FORMAT = 'snl1p2d1'

  include HTTParty
  base_uri 'download.finance.yahoo.com'


  # returns an array of Yahoo::Stock
  # Sorry, the Yahoo! Finance system limits quotes to 200 ticker
  # symbols at a time, and your request included 506ticker symbols.
  # Please adjust your request to include 200or less
  # If that happens see typhoeus

  def self.get_stocks symbols
    s = symbols.uniq.join('+')
    response = CSV.parse(get('/d/quotes.csv', query: { s: s, f: FORMAT }))
    response.map do |r|
      Yahoo::Stock.new(r)
    end
  end
end
