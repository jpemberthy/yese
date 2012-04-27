require 'date'
module Yahoo
  class Stock
    attr_accessor :symbol , :name, :price, :variation, :date
    #formar        s      ,  n   , l1    , p2        , d1
    def initialize row
      @symbol, @name, @price, @variation, @date = *row
    end

    def price
      Float @price
    end

    def variation
      Float @variation.gsub('%','')
    end

    def date
      Date.strptime @date, "%m/%d/%Y"
    end

    def attrs
      {
        symbol: symbol,
        name:   name,
        variation: variation,
        close_price: price,
        close_date: date
      }
    end
  end
end
