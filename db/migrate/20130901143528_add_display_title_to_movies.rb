class AddDisplayTitleToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :display_title, :string
  end
end
