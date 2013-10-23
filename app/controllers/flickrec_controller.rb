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
		@tweets = {}
		RottenList.find(:type => "in_theaters").each do |movie|
			@movietitle = movie.title
			tweets_array = Twitter.search("#" + movie.title, :lang => "en", :count => 15).results.map do |tweet|
				tweet.text
			end
			@tweets[movie.title] = tweets_array
		end
		# @tweets.each do |x, y|
		# 	x = @display
		
		@good_words = ["good", "amazing", "film", "movie", "gravity", "meatball"]

		@bad_words = ["bad", "terrible", "so bad", "hated", "don't watch", "gravity"]
		# get good word count
		# @i = 0
		# @tweets.each{|movie_title, movie_tweets| movie_tweets.each{|tweet| @i += 1 if tweet "film" } }
		
		# @tweets.each do |key, value|
		# 	value.each do |tweets|
		# 		@empty_array = []
		# 		tweets.split(',')
		# 		tweets.to_s
		# 		@empty_array << tweets
			
		# 	end
		# 	@key = key
		# 	@intersection = @empty_array & @good_words
		# 	end




		render :index
	end
end