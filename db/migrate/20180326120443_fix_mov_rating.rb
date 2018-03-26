class FixMovRating < ActiveRecord::Migration[5.1]
  def self.up
    change_table :movies do |t|
      t.change :mov_rating, :integer
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :mov_rating, :float
    end
  end
end