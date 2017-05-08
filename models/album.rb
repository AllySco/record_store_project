require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

attr_reader :id, :title, :artist_id, :quantity, :genre, :buy_price, :sell_price
attr_accessor :value

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @artist_id = params['artist_id'].to_i if params['artist_id']
    @quantity = params['quantity'].to_i if params['quantity']
    @genre = params['genre']
    @buy_price = params['buy_price'].to_i if params['buy_price']
    @sell_price = params['sell_price'].to_i if params['sell_price']
  end

  def save
    sql = "INSERT INTO albums (
    title, artist_id, quantity, genre, buy_price, sell_price
    ) VALUES (
    '#{@title}', #{@artist_id}, #{@quantity}, '#{@genre}', #{@buy_price}, #{@sell_price}
    )
    RETURNING id"
    album = SqlRunner.run(sql)
    @id = album.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM albums WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def Album.delete_all()
    sql = "DELETE from albums;"
    SqlRunner.run(sql)
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def Album.find(id) 
    sql = "SELECT * FROM albums WHERE id=#{id};"
    album = SqlRunner.run(sql)
    result = Album.new(album.first)
    return result
  end

  def update()
    sql = "UPDATE albums SET
    title = '#{@title}',
    genre = '#{@genre}',
    quantity = #{@quantity},
    artist_id = #{@artist_id},
    buy_price = #{@buy_price},
    sell_price = #{@sell_price}
    WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT name FROM artists
    WHERE id = #{@artist_id};"
    results = SqlRunner.run(sql)
    artist_hash = results.first()
    artist_object = Artist.new(artist_hash)
    return artist_object
  end

  def stock_level
    case @quantity
    when (0..5)
      "Low"
    when (6..10)
      "Medium"
    else
      if @quantity > 10
        "High"
      end
    end
  end

  def Album.total_stock_value
    total = 0
    Album.all.each() { |album| total += album.value  }
    return total
  end

  def value
    value = @quantity * @buy_price
    return value
  end

end