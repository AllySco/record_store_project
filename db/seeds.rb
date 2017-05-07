require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Artist.delete_all
Album.delete_all


artist1 = Artist.new({
  'name' => 'Dead Kennedys'
  })

artist2 = Artist.new({
  'name' => 'System Of A Down'
  })

artist3 = Artist.new ({
  'name' => 'Wu-Tang Clan'
  })

artist1.save
artist2.save
artist3.save


album1 = Album.new({
  'title' => 'Fresh Fruit For Rotting Vegetables',
  'artist_id' => artist1.id,
  'quantity' => 5,
  'genre' => 'Punk Rock',
  'buy_price' => 4,
  'sell_price' => 8
  })

album2 = Album.new({
  'title' => 'Give Me Convenience Or Give Me Death',
  'artist_id' => artist1.id,
  'quantity' => 8,
  'genre' => 'Punk Rock',
  'buy_price' => 4,
  'sell_price' => 8
  })

album3 = Album.new ({
  'title' => 'Hypnotize',
  'artist_id' => artist2.id,
  'quantity' => 6,
  'genre' => 'Metal',
  'buy_price' => 5,
  'sell_price' => 10
  })

album4 = Album.new ({
  'title' => 'Toxicity',
  'artist_id' => artist2.id,
  'quantity' => 12,
  'genre' => 'Metal',
  'buy_price' => 5,
  'sell_price' => 10
  })

album5 = Album.new ({
  'title' => 'Enter The Wu-Tang (36 Chambers)',
  'artist_id' => artist3.id,
  'quantity' => 13,
  'genre' => 'Hip Hop',
  'buy_price' => 6,
  'sell_price' => 12
  })

album6 = Album.new ({
  'title' => 'Wu-Tang Forever',
  'artist_id' => artist3.id,
  'quantity' => 13,
  'genre' => 'Hip Hop',
  'buy_price' => 6,
  'sell_price' => 12
  })

album1.save
album2.save
album3.save
album4.save
album5.save
album6.save


binding.pry
nil


