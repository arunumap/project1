class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title, null: false
    	t.string :year, null: false
    	t.string :mpaa_rating, null: false

    	t.timestamps
    end
  end
end
