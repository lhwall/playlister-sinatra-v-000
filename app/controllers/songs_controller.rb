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
   @song = Song.create(:name => params[:Name])

 @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])  #  else
  #    #binding.pry
  #    @song.artist_id = params[:song][:artist_id].to_i
  #  end
   if params[:genres]
   @song.genre_ids << params[:genres][]
 end
   @song.save
   redirect to "/songs/#{@song.slug}"
 end

 get "/songs/:slug" do
   #binding.pry
   @song = Song.find_by_slug(params[:slug])
   if @song.artist
   @artist = @song.artist
 end
 if @song.genres
   @genres = @song.genres
 end
   erb :"/songs/show"
 end


end
