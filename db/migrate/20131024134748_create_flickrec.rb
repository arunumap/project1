class CreateFlickrec < ActiveRecord::Migration
  def change
    create_table :flickrecs do |t|
    	t.string :movie_title, null: false
    	t.string :image_url, null: false
    	t.string :flickrec_score

    	t.timestamps
    end
  end
end
