require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

get '/artists' do
  @artists = Artist.all
  erb(:index)
end

get '/artists/new' do
  erb(:new)
end

get '/artists/:id' do 
  @albums = Album.find(params[:id])
  erb(:show)
end

post '/artists' do
  @artists = Album.new(params)
  @artists.save
  erb(:create)
end

get '/artists/id/edit'do
  @albums = Artist.find(params[:id])
  erb(:edit)
end

post '/artists/:id' do
  @artists = Artist.new(params)
  @artists.update()
end

post '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  @artist.delete()
  erb(:destroy)
end


