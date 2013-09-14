class MovieMeta < ActiveRecord::Base

  validates_uniqueness_of :rotten_id

  # this model stores data for all movie and is populated via the retrieve! class method

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
      details = retrieve_data(page)
      store_movie_details!(details)
      logger.info "RETRIEVE movie (#{count}/#{arr_size}): (#{details[:rotten_id]}) #{details[:title]}"
    end
  end

  private

  def self.search_for_movie(query)
    browser = Watir::Browser.new :phantomjs
    browser.goto "http://www.rottentomatoes.com"
    browser.text_field(:name, "search").set(query)
    browser.send_keys :enter
    browser.ul(:id => "movie_results_ul").div(:class => "media_block_content").h3(:class => "nomargin").wait_until_present
    browser.ul(:id => "movie_results_ul").div(:class => "media_block_content").h3(:class => "nomargin").a.click
    browser
  end

  def self.retrieve_data(page)
    page.h1(:class => 'movie_title').wait_until_present

    details = {}
    details[:title] = page.title.gsub("- Rotten Tomatoes", "")
    details[:rotten_id] = page.div(:id => "mob_rating_widget").attribute_value("movieId")
    details[:year] = page.h1(:class => 'movie_title').text.reverse.match(/(\d{4})/)[0].reverse
    details[:rotten_url] = page.url
    puts details.inspect
    details
  end

  def self.store_movie_details!(details)

  end
end