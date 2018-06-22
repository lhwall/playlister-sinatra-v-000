class GenresController < ApplicationController

  get "/genres" do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get "/genres/new" do
    erb :"/genres/new"
  end

 post "/genres" do
   @genre = Genre.create(params[:genre])

   redirect to "/genre/#{genre.slug}"
 end

 get "/genre/:slug" do
   @gnre = Genre.find_by(slug: params[:slug])
   erb :"/genres/show"
 end
end
