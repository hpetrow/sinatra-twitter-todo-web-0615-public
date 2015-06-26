# This class handles connecting to the Twitter API. In Rack Todo, this lived in app.rb. Here's we've abstracted it out into its own class. This class we will then initialize in app.rb.

# Our Gemfile has the twitter gem and config/environment requires it through Bundler.

class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    # go to https://dev.twitter.com/apps and create your own twitter app. Then grab your keys and replace these ones
    config.consumer_key = "NljJjdu3jdHATys8d7sYmjZEO"
    config.consumer_secret = "QkUQZ7UzlQwHWm8HBUdDff522ATDWi0K1YGRsKUonVEh54Jnq5"
    config.access_token = "1465600190-gX4VNxLtghidNehib20KnKlnOIYcJ4yu1wEvJUy"
    config.access_token_secret = "znaa6svMvIV6gF6orhax3WGPRxQ1IBxq0Kka3QPZWPBkf"
  end

  def get_search_results
    twitter_search_results = []
    TWITTER.search(handle).each do |tweet|
      # we're saving the tweet user's name and the tweet text in an array of arrays
      twitter_search_results << [tweet.user.name, tweet.text]
    end
    twitter_search_results
  end

end