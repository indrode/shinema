class MovieMeta < ActiveRecord::Base

  validates_uniqueness_of :rotten_id

  # this model stores data for all movie and is populated via the retrieve! class method


  # TODO
  # store poster url
  # save error movies in array and re-run with new array until no errors left (recursion)
  # methods return hash, e.g. {:page => page, :errors => ["unknown_movie", "unknown_movie2"]}


  def autocomplete_display
    "#{self.title} (#{self.year})"
  end

  # arr contains a movie search query
  # retrieve! searches for a movie and follows the first search result
  # from the movie detail page, it scrapes the following attributes
  # - rotten tomatoes movie id
  # - title
  # - year
  # - poster image url
  # - movie page url
  def self.retrieve!(arr)
    arr_size = arr.size
    count = 0
    logger.info "RETRIEVE processing #{arr_size} movies..."
    arr.each do |query|
      count += 1
      page = search_for_movie(query)
      if page
        details = retrieve_data(page, query)
        store_movie_details!(details) if details
      end
    end
  end

  private

  def self.search_for_movie(query)
    begin
      browser = Watir::Browser.new :phantomjs
      browser.goto "https://www.google.de/#q=#{query} rotten tomatoes"
      # browser.text_field(:name, "search").set("#{query} rotten tomatoes")
      # browser.send_keys :enter
      logger.info "PROCESSING..."
      browser.link(:text => /Rotten Tomatoes/).click
      # browser.ul(:id => "movie_results_ul").div(:class => "media_block_content").h3(:class => "nomargin").wait_until_present
      # browser.ul(:id => "movie_results_ul").div(:class => "media_block_content").h3(:class => "nomargin").a.click
      browser
    rescue
      logger.info "ERROR: #{query}"
      false
    end
  end

  def self.retrieve_data(page, query)
    begin
      page.h1(:class => 'movie_title').wait_until_present

      details = {}
      details[:title] = page.title.gsub("- Rotten Tomatoes", "")
      details[:rotten_id] = page.div(:id => "mob_rating_widget").attribute_value("movieId")
      details[:year] = page.h1(:class => 'movie_title').text.reverse.match(/(\d{4})/)[0].reverse
      details[:rotten_url] = page.url
      puts details.inspect
      details
    rescue
      logger.info "ERROR: #{query}"
      false
    end
  end

  def self.store_movie_details!(details)
    MovieMeta.create(details)
  end
end