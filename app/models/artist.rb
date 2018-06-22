require_relative './concerns/slugafiable.rb'

class Artist < ActiveRecord::Base
  extend Slugafiable::ClassMethods
  include Slugafiable::InstanceMethods
  has_many :songs
  has_many :genres, through: :songs
end
