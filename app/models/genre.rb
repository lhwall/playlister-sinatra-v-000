class Genre < ActiveRecord::Base
  extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods
  has_many :song_genres
  has_many :artist_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # def slug
  #   slug = ""
  #   #binding.pry
  #   self.name.to_s.split("").each do |character|
  #     if character.match(/[a-zA-Z]/)
  #       slug << character.downcase
  #     elsif character.match(/\s/)
  #       slug << "-"
  #     end
  #   end
  #   slug
  # end
  #
  # def self.find_by_slug(entry)
  #   value = nil
  #   self.all.each do |genre|
  #     if genre.slug == entry
  #       value = genre
  #     end
  #   end
  #   value
  # end

end
