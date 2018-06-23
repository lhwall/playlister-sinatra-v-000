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
     @song.artist_id = Artist.create(:name => params[:song][:artist]).id
   else
     #binding.pry
     @song.artist_id = params[:song][:artist_id].to_i
   end
   binding.pry
   @song.save
   redirect to "/songs/#{@song.slug}"
 end

 get "/songs/:slug" do
   @song = Song.find_by_slug(params[:slug])
   @artist = @song.artist
   @genres = @song.genres
   erb :"/songs/show"
 end


end
