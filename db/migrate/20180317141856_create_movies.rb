class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :stars
      t.datetime :release

      t.timestamps
    end
  end
end
