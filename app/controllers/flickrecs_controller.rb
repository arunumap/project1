class FlickrecsController < ApplicationController
	include RottenTomatoes
	Twitter.configure do |config|
		config.consumer_key = "GvZS4mzrgaZrUlqCLcMUPQ"
		config.consumer_secret = "VkrAwyiNC3a6gTuD9Wba0sGVNOB0aI8Lp0URGZbCOu0"
		config.oauth_token = "47588186-0ZY0qIOdXbadJR6q8AWcgpHFS5ZTR8AJOFXlnvCC0"
		config.oauth_token_secret = "WnpLTvz3GBmASraZQqHQYf4KGYI1AU3vsNRsnjK4M"
	end

	Rotten.api_key = "gwc2mhjxd4kfs2ag7bsf4uxq"

	def index
		get_flicks
		movie_score
		@image = RottenList.find(:type => "in_theaters")

		render :index
	end

	def create
		create


	end

	
end