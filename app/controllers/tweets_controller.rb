class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user
  layout 'application'

  def overview
    @query = params[:q]
    @twitter_data = Rails.cache.fetch("/twitter/search/#{@query}", expires_in: 5.minutes) do
      twitter_client.search(@query)
    end
  end

  def user
    @screen_name = params[:screen_name]
    @twitter_data = Rails.cache.fetch("/twitter/user/#{@screen_name}", expires_in: 5.minutes) do
      twitter_client.user_timeline(@screen_name)
    end
  end

  private

  def set_user
    @user = current_user
  end

  def twitter_client
    current_user.twitter_client
  end
end
