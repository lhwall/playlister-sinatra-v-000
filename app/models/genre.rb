class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artist_genres
  has_many :songs, through: :song_genre
  has_many :artists, through: :songs
end
