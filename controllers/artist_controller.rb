require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

get '/artists' do
  @artists = Artist.all
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

get '/artists/:id' do 
  @artists = Artist.find(params[:id])
  erb(:"artists/show")
end

post '/artists' do
  @artists = Artist.new(params)
  @artists.save
  erb(:"artists/create")
end

get '/artists/:id/edit'do
  @artists = Artist.find(params[:id])
  erb(:"artists/edit")
end

post '/artists/:id' do
  @artists = Artist.new(params)
  @artists.update()
  erb(:"artists/update")
end

post '/artists/:id/delete' do
  @artists = Artist.find(params[:id])
  @artists.delete()
  erb(:"artists/destroy")
end

