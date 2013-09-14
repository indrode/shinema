class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :meta_id
      t.integer :tomato_id
      t.string  :title
      t.integer :rating
      t.integer :year

      t.timestamp
    end

    execute("ALTER TABLE movies AUTO_INCREMENT = 30000")

    add_index(:movies, :user_id)
    add_index(:movies, :meta_id)
    add_index(:movies, :tomato_id)
    add_index(:movies, :genre_id)
  end
end
