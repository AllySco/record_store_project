require_relative('../db/sql_runner.rb')
require('pg')
require_relative('album.rb')

class Shop

  def Shop.total_stock_value
    total = 0
    Album.all.each() { |album| total += album.value  }
    return total
  end
end