class AddCustomToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :mov_rating, :float
    add_column :movies, :Run_time, :time    
  end
end
