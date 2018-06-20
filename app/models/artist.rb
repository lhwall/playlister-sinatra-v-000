class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

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
    self.all.each do |artist|
      if artist.slug == entry
        value = artist
      end
    end
    value
  end

end
