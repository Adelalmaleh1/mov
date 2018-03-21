class AddColumnsToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :category_id, :string
    add_column :movies, :—force, :string
  end
end
