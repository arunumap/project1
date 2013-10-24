class MoviesController < ApplicationController
	include RottenTomatoes
	Rotten.api_key = "gwc2mhjxd4kfs2ag7bsf4uxq"

	def create
		@tweets = {}
		RottenList.find(:type => "in_theaters").each do |movie|
			@movietitle = movie.title
			tweets_array = Twitter.search("#" + movie.title, :lang => "en", :count => 15).results.map do |tweet|
				tweet.text
			end
			@tweets[movie.title] = tweets_array
		end
		params.require(:movie).permit(:title, :year, :mpaa_rating)



	end