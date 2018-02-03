class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    look_up_stock = StockQuote::Stock.quote(ticker_symbol)
    price = strip_commas(look_up_stock.l)
    new(name: look_up_stock.name, ticker: look_up_stock.symbol, last_price: price)
  rescue Exception => e
    return nil
  end


  def self.strip_commas(number)
    number.gsub(',', '')
  end

end
