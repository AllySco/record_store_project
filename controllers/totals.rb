require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

get '/totals' do
  @artists = Artist.total_artists
  @albums = Album.total_albums
  @albums_value = Album.total_stock_value
  erb(:totals)
end