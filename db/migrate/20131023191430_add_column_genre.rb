class AddColumnGenre < ActiveRecord::Migration
  def change
  	add_column :movies, :genre, :string, null: false
  end
end
