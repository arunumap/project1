class Flickrec << ActiveRecord::Base

		def create
			@movies_and_score.each do |movie_title, score|
				movie_title
				RottenMovie.find(:title => movie_title, :limit => 1).each do |movie|
					movie.posters.detailed
					binding.pry
				end
			end
			@to_db = Flickrec.new(movie_title: movie_title, image_url: movie.posters.detailed, flickrec_score: score)
			@to_db.save
			redirect_to flickrecs_path
		end


	

end