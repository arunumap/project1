module FlickrecHelper
	include RottenTomatoes
		Twitter.configure do |config|
		config.consumer_key = "GvZS4mzrgaZrUlqCLcMUPQ"
		config.consumer_secret = "VkrAwyiNC3a6gTuD9Wba0sGVNOB0aI8Lp0URGZbCOu0"
		config.oauth_token = "47588186-0ZY0qIOdXbadJR6q8AWcgpHFS5ZTR8AJOFXlnvCC0"
		config.oauth_token_secret = "WnpLTvz3GBmASraZQqHQYf4KGYI1AU3vsNRsnjK4M"
	end

	Rotten.api_key = "gwc2mhjxd4kfs2ag7bsf4uxq"
	def get_flicks
		@tweets = {}
		RottenList.find(:type => "in_theaters").each do |movie|
			tweets_array = Twitter.search("#" + movie.title, :lang => "en", :count => 15).results.map do |tweet|
				tweet.text
			end
			@tweets[movie.title] = tweets_array
		end
	end

	def movie_score
		good_words = ["good", "amazing", "first-rate", "insightful", "clever", "charming", "comical", "charismatic", "enjoyable", "uproarious", "original", "tender", "hilarious", "absorbing", "sensitive", "riveting", "intriguing", "powerful", "fascinating", "pleasant", "surprising", "dazzling", "thought provoiking", "imaginative", "legendary", "unpretentious", "edge of my seat", "spectacular", "2 thumbs up", "thumbs up", "entertaining", "epic", "touching", "cray", "adoring", "admiring", "romantic", "euphoric", "excited", "tender", "gushy", "gleeful", "happy", "beautiful", "effusive", "phenom", "swell", "exciting", "greatest", "most incredible", "incredible", "greatest movie of all time", "greatest movie ever", "amazing thing", "speechless", "perfect", "holla", "wow", "academy", "award", "great job", "cute", "forward", "can't wait", "cant wait", "believe", "goin", "going", "to see", "holy", "fantastic", "wanted to", "want to", "vivid"]
		bad_words = ["bad", "terrible", "so bad", "hated", "don't watch"]
		matched_good_words = []
		matched_bad_words = [] 
		@movies_and_score = {}
		@tweets.each do |movie_title, tweets|
			matched_good_words.clear
			matched_bad_words.clear
			@good_size = 0; @bad_size = 0
			tweets.each do |tweet|
				good_words.each do |word|
					if tweet.include?(word)
						matched_good_words << word 
						@good_size = matched_good_words.count 
					end
				end
				bad_words.each do |bad|
					if tweet.include?(bad)
						matched_bad_words << bad
						@bad_size = matched_bad_words.count
					end
				end
			
			end
			score = @good_size - @bad_size
			@movies_and_score[movie_title] = score
		end
		
	end

	def create
			@movies_and_score.each do |movie_title, score|
			RottenMovie.find(:title => movie_title, :limit => 1).each do |movie|
				movie.posters.detailed
			end
			@to_db = Flickrec.new(movie_title: movie_title, image_url: movie.posters.detailed, flickrec_score: score)
			@to_db.save!
		end
	end


end