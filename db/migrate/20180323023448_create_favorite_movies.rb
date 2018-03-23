class CreateFavoriteMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_movies do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
