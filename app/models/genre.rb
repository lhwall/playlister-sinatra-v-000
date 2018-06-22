class Genre < ActiveRecord::Base
  extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods
  has_many :song_genres
  has_many :artist_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end
