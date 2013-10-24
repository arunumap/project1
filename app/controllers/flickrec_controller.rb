class FlickrecController < ApplicationController
	include RottenTomatoes
	Twitter.configure do |config|
		config.consumer_key = "GvZS4mzrgaZrUlqCLcMUPQ"
		config.consumer_secret = "VkrAwyiNC3a6gTuD9Wba0sGVNOB0aI8Lp0URGZbCOu0"
		config.oauth_token = "47588186-0ZY0qIOdXbadJR6q8AWcgpHFS5ZTR8AJOFXlnvCC0"
		config.oauth_token_secret = "WnpLTvz3GBmASraZQqHQYf4KGYI1AU3vsNRsnjK4M"
	end

	Rotten.api_key = "gwc2mhjxd4kfs2ag7bsf4uxq"

	def index
		@flicks = get_flicks
		@score = movie_score
		# @tweets = {}
		# 	RottenList.find(:type => "in_theaters").each do |movie|
		# 	tweets_array = Twitter.search(movie.title, :lang => "en", :count => 15).results.map do |tweet|
		# 		tweet.text
		# 	end
		# 	@tweets[movie.title] = tweets_array
		# end
		
		# @good_words = ["good", "amazing", "first-rate", "insightful", "clever", "charming", "comical", "charismatic", "enjoyable", "uproarious", "original", "tender", "hilarious", "absorbing", "sensitive", "riveting", "intriguing", "powerful", "fascinating", "pleasant", "surprising", "dazzling", "thought provoiking", "imaginative", "legendary", "unpretentious", "edge of my seat", "spectacular", "2 thumbs up", "thumbs up", "entertaining", "epic", "touching"]

		# @bad_words = ["bad", "terrible", "so bad", "hated", "don't watch", "gravity"]

		render :index
	end
	
end