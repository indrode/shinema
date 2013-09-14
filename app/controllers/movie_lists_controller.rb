class MovieListsController < ApplicationController
  before_action :set_movie_list, only: [:show, :edit, :update, :destroy]

  def index
    @movie_lists = MovieList.all
  end

  def show
  end

  def new
    @movie_list = MovieList.new
  end

  def edit
  end

  def create
    @movie_list = MovieList.new(movie_list_params)

    respond_to do |format|
      if @movie_list.save
        format.html { redirect_to @movie_list, notice: 'Movie list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie_list.update(movie_list_params)
        format.html { redirect_to @movie_list, notice: 'Movie list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie_list.destroy
    respond_to do |format|
      format.html { redirect_to movie_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_list
      @movie_list = MovieList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_list_params
      params.require(:movie_list).permit(:title)
    end
end
