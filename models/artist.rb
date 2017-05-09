require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save
    sql = "INSERT INTO artists (
    name
    ) VALUES (
    '#{@name}'
    )
    RETURNING id"
    artist = SqlRunner.run(sql)
    @id = artist.first()['id'].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def Artist.delete_all()
    sql = "DELETE from artists;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists SET
    name = '#{@name}'
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Artist.find(id) 
    sql = "SELECT * FROM artists WHERE id=#{id};"
    artist = SqlRunner.run(sql)
    result = Artist.new(artist.first)
    return result
  end

  def albums
    sql = "SELECT * FROM albums
    WHERE @artist_id = #{@id};"
    album_hashes = SqlRunner.run(sql)
        album_objects = album_hashes.map { |album_hash| Album.new(album_hash) }
        return album_objects

  end

  def Artist.total_artists
    total = Artist.all.count
    return total
  end

end