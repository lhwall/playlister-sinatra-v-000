class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/new" do
    erb :"/songs/new"
  end

 post "/songs" do
   #binding.pry
   @song = Song.create(:name => params[:song][:name])
   if !params[:song][:artist].empty?
     @song.artist = Artist.create(:name => params[:song][:artist])
   end
   @artist = @song.artist
   @song.save
   #binding.pry
   redirect to "songs/#{@song.slug}"
 end

 get "/songs/:slug" do
   @song = Song.find_by_slug(params[:slug])
   @artist = @song.artist
   @genre = @song.genres
   erb :"/songs/show"
 end


end
