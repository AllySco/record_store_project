require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')


get '/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all
  erb(:"albums/new")
end

get '/albums/:id' do 
  @albums = Album.find(params[:id])
  erb(:"albums/show")
end

post '/albums' do
  @albums = Album.new(params)
  @albums.save
  erb(:"albums/create")
end

get '/albums/:id/edit'do
  @albums = Album.find(params[:id])
  erb(:"albums/edit")
end

post '/albums/:id' do
  @albums = Album.new(params)
  @albums.update()
  erb(:"albums/update")
end

post '/albums/:id/delete' do
  @albums = Album.find(params[:id])
  @albums.delete()
  erb(:"albums/destroy")
end


