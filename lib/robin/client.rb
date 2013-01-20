require_relative 'config'
require_relative 'user'
require 'twitter'

module Robin
  class Client
    Robin::User.load_credentials
    @client = Twitter::Client.new(
      :consumer_key => Robin::Config.key,
      :consumer_secret => Robin::Config.secret,
      :oauth_token => Robin::User.token,
      :oauth_token_secret => Robin::User.secret)

    def self.home_timeline
      @client.home_timeline
    end

    def self.user_timeline(user = nil)
      if user
        @client.user_timeline(user)
      else
        @client.user_timeline
      end
    end

    def self.tweet(message)
      @client.update(message)
    end

    def self.followers(user = nil)
      if user
        @client.followers(user).users
      else
        @client.followers.users
      end
    end
  end
end
