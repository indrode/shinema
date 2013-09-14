class MovieMetasController < ApplicationController

  def list
    list = []
    movies = MovieMeta.where("title LIKE ?", "%#{params[:term]}%").limit(10)
    movies.each { |movie| list << {"label" => movie.title} }

    respond_to do |format|
      format.json { render :json => list.to_json, :layout => false}
    end
  end

end
