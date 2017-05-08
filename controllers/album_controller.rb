require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')


get '/albums' do
  @albums = Album.all
  erb(:"album/index")
end

get '/albums/new' do
  erb(:"album/new")
end

get '/albums/:id' do 
  @albums = Album.find(params[:id])
  erb(:"album/show")
end

post '/albums' do
  @albums = Album.new(params)
  @albums.save
  erb(:"album/create")
end

get '/albums/id/edit'do
  @albums = Album.find(params[:id])
  erb(:"album/edit")
end

post '/albums/:id' do
  @albums = Album.new(params)
  @albums.update()
  erb(:"album/update")
end

post '/albums/:id/delete' do
  @albums = Album.find(params[:id])
  @albums.delete()
  erb(:destroy)
end


