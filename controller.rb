require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')


get '/albums' do
  @albums = Album.all
  erb(:index)
end

get '/albums/new' do
  erb(:new)
end

get '/albums/:id' do 
  @albums = Album.find(params[:id])
  erb(:show)
end

post "/albums" do
  @albums = Album.new(params)
  @albums.save
  erb(:create)
end