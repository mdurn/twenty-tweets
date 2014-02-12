class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user
  layout 'application', except: [:search_log]

  def overview
    @query = params[:q]
    @user.log_twitter_search!(@query) if @query.present?
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

  def search_log
    @queries = TwitterSearchQuery.all.order('id DESC')
  end

  private

  def set_user
    @user = current_user
  end

  def twitter_client
    current_user.twitter_client
  end
end
