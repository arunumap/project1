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
		begin
			
		@tweets = {}
		RottenList.find(:type => "in_theaters").each do |movie|
			tweets_array = Twitter.search("#" + movie.title.gsub(" ",""), :lang => "en", :count => 15).results.map do |tweet|
				tweet.text
			end
			@tweets[movie.title] = tweets_array
		end

		rescue Twitter::Error::ClientError => e
			logger.info "------------TWITTER API NOT RESPONDING---------------"
			return nil
		end
	end

	def movie_score

		good_words = ["good", "amazing", "first-rate", "insightful", "clever", "charming", "comical", "charismatic", "enjoyable", "uproarious", "original", "tender", "hilarious", "absorbing", "sensitive", "riveting", "intriguing", "powerful", "fascinating", "pleasant", "surprising", "dazzling", "thought provoiking", "imaginative", "legendary", "unpretentious", "edge of my seat", "spectacular", "2 thumbs up", "thumbs up", "entertaining", "epic", "touching", "cray", "adoring", "admiring", "romantic", "euphoric", "excited", "tender", "gushy", "gleeful", "happy", "beautiful", "effusive", "phenom", "swell", "exciting", "greatest", "most incredible", "incredible", "greatest movie of all time", "greatest movie ever", "amazing thing", "speechless", "perfect", "holla", "wow", "academy", "award", "great job", "cute", "forward", "can't wait", "cant wait", "believe", "goin", "going", "to see", "holy", "fantastic", "wanted to", "want to", "vivid", "3-D",
 "acclaimed",
 "adult",
 "adventurous",
 "ambitious",
 "artistic",
 "astonishing",
 "avant-garde",
 "award-winning",
 "awe-inspiring",
 "based",
 "on",
 "beautifully",
 "filmed",
 "beautifully",
 "shot",
 "big-budget",
 "bold",
 "brilliant",
 "captured",
 "cerebral",
 "character-driven",
 "cinematic",
 "coherent",
 "colorful",
 "comic",
 "compelling",
 "complex",
 "conceptual",
 "contemplative",
 "contemporary",
 "controversial",
 "conversational",
 "convincing",
 "creative",
 "critically",
 "acclaimed",
 "cult",
 "current",
 "daring",
 "deep",
 "deeply",
 "thoughtful",
 "delightful",
 "dizzying",
 "dramatic",
 "edgy",
 "effective",
 "elevating",
 "eloquent",
 "emotional",
 "emotionally",
 "charged",
 "emotionally",
 "resonant",
 "enchanted",
 "engaging",
 "engrossing",
 "enigmatic",
 "evocative",
 "exceptional",
 "exquisite",
 "extraordinary",
 "family-friendly",
 "fast-paced",
 "feel-good",
 "filmed",
 "filmed",
 "live",
 "fluid",
 "fresh",
 "fun",
 "funny",
 "futuristic",
 "graceful",
 "graphic",
 "gripping",
 "highly",
 "original",
 "historical",
 "honest",
 "humorous",
 "immensely",
 "talented",
 "impassioned",
 "important",
 "in-depth",
 "independent",
 "infused",
 "inspirational",
 "inspired",
 "intellectual",
 "intellectually",
 "invigorating",
 "intelligent",
 "intense",
 "intensive",
 "interesting",
 "introspective",
 "intuitive",
 "inventive",
 "inventively",
 "edited",
 "ironic",
 "layered",
 "light-hearted",
 "magical",
 "magnetic",
 "mature",
 "meaningful",
 "memorable",
 "mind-blowing",
 "modern",
 "moving",
 "must-see",
 "mysterious",
 "mystical",
 "narrative",
 "non-stop",
 "offbeat",
 "passionate",
 "phenomenal",
 "playful",
 "plot-driven",
 "ponderous",
 "popular",
 "pornographic",
 "potent",
 "profound",
 "provoking",
 "pure",
 "quirky",
 "rated",
 "realistic",
 "recommended",
 "refined",
 "refreshing",
 "relevant",
 "remarkable",
 "resourceful",
 "revealing",
 "rich",
 "rousing",
 "satirical",
 "sentimental",
 "sexy",
 "small-budget",
 "star-studded",
 "strong",
 "stunning",
 "superb",
 "suspenseful",
 "sweet",
 "theatrical",
 "thrilling",
 "underground",
 "unforgettable",
 "visionary",
 "visual",
 "well-paced",
 "worthwhile"]
		bad_words = ["bad", "terrible", "so bad", "hated", "don't watch", "a bore",
 "arrogant",
 "average",
 "banal",
 "blasé",
 "boring",
 "catastrophe",
 "childish",
 "cliché",
 "common",
 "conceited",
 "confusing",
 "contrived",
 "copied",
 "crude",
 "dated",
 "depressing",
 "disappointing",
 "disjointed",
 "dissatisfying",
 "distracting",
 "drab",
 "dreadful",
 "dry",
 "dull",
 "empty",
 "excruciating",
 "failure",
 "forced",
 "formulaic",
 "frantic",
 "frustrating",
 "gimmicky",
 "grating",
 "hard to follow",
 "heavily flawed",
 "holes in the plot",
 "hollow",
 "horrible",
 "implausible",
 "in poor taste",
 "inconsistent",
 "irrelevant",
 "irritating",
 "juvenile",
 "lacking",
 "lacking talent",
 "lackluster",
 "lifeless",
 "little character development",
 "low budget",
 "meaningless",
 "mechanical",
 "mediocre",
 "melodramatic",
 "mindless action",
 "misinformed",
 "needless",
 "needs editing",
 "obnoxious",
 "obvious",
 "offensive",
 "one-dimensional",
 "characters overact",
 "overly-complicated",
 "overly-sentimental",
 "overrated",
 "paper-thin plot",
 "pedestrain",
 "poor acting",
 "poor pacing",
 "poorly-conceived",
 "poorly-directed",
 "poorly-executed",
 "poorly-filmed",
 "poorly-produced",
 "poorly-written",
 "preachy",
 "predictable",
 "pretentious",
 "rambling",
 "redundant",
 "sappy",
 "self-absorbed",
 "senseless",
 "sentimentalized",
 "silly",
 "skeletal",
 "development",
 "slanted",
 "slow",
 "slow-going",
 "so-so",
 "sophomoric",
 "stereotype",
 "stereotyped",
 "sterile",
 "stock plot",
 "straight-to-DVD",
 "superficial",
 "tasteless",
 "tedious",
 "thin",
 "tiresome",
 "too long",
 "tragic",
 "transparent",
 "trendy",
 "trivial",
 "typecast",
 "unaffecting",
 "unconvincing",
 "underwhelming",
 "unimaginative",
 "unimportant",
 "uninspired",
 "unintelligent",
 "uninteresting",
 "unoriginal",
 "unpracticed",
 "unrefined",
 "unresolved",
 "unsatisfactory",
 "unsatisfying",
 "untalented",
 "vacuous",
 "waste of time"]

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


end