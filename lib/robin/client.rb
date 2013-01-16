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

    def self.user_timeline
      @client.user_timeline
    end
  end
end
