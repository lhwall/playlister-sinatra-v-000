class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    slug = ""
    #binding.pry
    self.name.to_s.split("").each do |character|
      if character.match(/[a-zA-Z]/)
        slug << character.downcase
      elsif character.match(/\s/)
        slug << "-"
      end
    end
    slug
  end

  def self.find_by_slug(entry)
    value = nil
    self.all.each do |song|
      if song.slug == entry
        value = song
      end
    end
    value
  end

end
