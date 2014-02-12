class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :omniauthable,
         :omniauth_providers => [:twitter]

  ###############
  # Validations #
  ###############

  validates_presence_of :password, on: :create
  validates_length_of :password, within: Devise.password_length, allow_blank: false

  ####################
  # Instance Methods #
  ####################

  def twitter_client
    TwitterUserClient.new(self)
  end

  #################
  # Class Methods #
  #################

  class << self

    def find_or_create_from_twitter(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.password = Devise.friendly_token[0,20]
        user.name = auth['info']['name']
        user.image = auth['info']['image']
        user.twitter_nickname = auth['info']['nickname']
        user.twitter_uri = auth['info']['urls']['Twitter']
        user.twitter_token = auth['credentials']['token']
        user.twitter_secret = auth['credentials']['secret']
      end
    end

  end


end
