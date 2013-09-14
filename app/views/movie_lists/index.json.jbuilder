json.array!(@movie_lists) do |movie_list|
  json.extract! movie_list, :title
  json.url movie_list_url(movie_list, format: :json)
end
