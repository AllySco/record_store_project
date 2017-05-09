require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')
require_relative('controllers/totals')
require_relative('models/artist.rb')
require_relative('models/album.rb')

get '/' do
  erb( :index )
end