module StockLoader
  def self.file
    @file ||= File.open File.join(Rails.root, 'db', 'stocks-symb-name.txt')
  end

  def self.symbols
    list = []
    file.each_line do |line|
      symbol = line.split("\t").first
      if symbol.match /\./
        partitions = symbol.rpartition '.'
        symbol = partitions.first.gsub('.', '-')
        symbol << "." << partitions.last
      end
      list << symbol
    end
    list
  end

  def self.load
    errors = {}
    symbols.each_slice(200) do |list|
      Yahoo.get_stocks(list).each do |stock|
        puts "Creando #{stock.symbol}"
        begin
          Stock.create stock.attrs
        rescue  Exception => e
          errors[stock.symbol] = e
        end
      end
    end
    errors
  end
end

