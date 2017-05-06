require('pg')
require_relative('../db/sql_runner.rb')

class Album

attr_reader :id, :title, :artist_id, :quantity, :genre, :buy_price, :sell_price

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










end