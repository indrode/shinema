class MoviesController < ApplicationController
  before_filter :verify_user, :get_movie_count
  before_filter :set_movie, only: [:show, :edit, :update, :destroy]

  autocomplete :movie_meta, :title, :extra_data => [:title, :year], :display_value => :autocomplete_display

  def index
    desc, order = params[:desc], params[:order]
    desc = "ASC" unless %w(ASC DESC).include?(desc)
    order = "title" unless %w(title year rating).include?(order)
    order = order ? "#{order} #{desc}, title asc" : "title"

    @desc = desc == "DESC" ? "ASC" : "DESC"
    @movies = current_user.movies.order(order)#.page(params[:page])
    @movie = current_user.movies.new
  end

  def show
  end

  def new
    @movie = current_user.movies.new
  end

  def edit
  end

  def create
    @movie = current_user.movies.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to action: :index, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = current_user.movies.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:display_title, :meta_id, :title, :year, :rating)
  end

  def verify_user
    puts "sfasdf"
    render :unauthorized, :text => "Unauthorized." unless current_user
  end

  def get_movie_count
    @movie_count = current_user.movies.count
  end

end
