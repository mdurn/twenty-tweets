require 'twitter'

class TwitterUserClient
  # A wrapper for the twitter gem with common functions for TwentyTweets.
  DEFAULT_SEARCH_QUERY = 'StackSocial'

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = APP_CONFIG['twitter']['consumer_key']
      config.consumer_secret     = APP_CONFIG['twitter']['consumer_secret']
      config.access_token        = user.twitter_token
      config.access_token_secret = user.twitter_secret
    end
  end

  # retrieve the last 20 tweets related to the search query
  def search(query)
    # need to handle invalid data
    q = query.blank? ? DEFAULT_SEARCH_QUERY : query
    @client.search(q, lang: 'en', result_type: 'recent').take(20)
  end

  # retrieve the last 20 tweets from a twitter user's timeline
  def user_timeline(screen_name)
    #need to handle invalid data
    @client.user_timeline(screen_name).take(20)
  end
end