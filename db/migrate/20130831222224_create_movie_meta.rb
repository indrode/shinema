class CreateMovieMeta < ActiveRecord::Migration
  def change
    create_table :movie_meta do |t|
      t.integer :rotten_id
      t.string :title
      t.integer :year
      t.string :poster_url
      t.string :rotten_url

      t.timestamps
    end
  end
end
