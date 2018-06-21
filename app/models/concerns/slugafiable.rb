module Slugafiable

module InstanceMethods
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

end

module ClassMethods
def find_by_slug(entry)
  value = nil
  self.all.each do |item|
    if item.slug == entry
      value = item
    end
  end
  value
end

end

end
