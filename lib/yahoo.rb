require 'httparty'
require 'csv'
module Yahoo
  include HTTParty
  base_uri 'download.finance.yahoo.com'
  default_params f: 'snl1p2d1'

  # Parse CSV
  def self.get(*args)
    CSV.parse super(*args).parsed_response
  end
  # returns an array of Yahoo::Stock
  # Sorry, the Yahoo! Finance system limits quotes to 200 ticker
  # symbols at a time, and your request included 506ticker symbols.
  # Please adjust your request to include 200 or less
  # If that happens see typhoeus

  def self.get_stocks symbols
    s = symbols.uniq.join('+')
    response = get('/d/quotes.csv', query: { s: s})
    response.map do |r|
      Yahoo::Stock.new(r)
    end
  end
end
