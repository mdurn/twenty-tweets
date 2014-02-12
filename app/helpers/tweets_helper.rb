module TweetsHelper
  def get_tweet_html(text)
    regex = /(?<!\S)(@)(\w+)(:|\s|$)/
    html_text = text.gsub(regex) do |match|
      "<a href=\"#{tweets_user_path($2)}\">#{$1 + $2}</a>#{$3}"
    end
    html_text.rstrip
  end
end
