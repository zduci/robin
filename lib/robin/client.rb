require 'twitter'

module Robin
  class Client
    def self.home_timeline
      Robin::User.load_credentials
      @client = Twitter::Client.new(
        :consumer_key => Robin::Config.key,
        :consumer_secret => Robin::Config.secret,
        :oauth_token => Robin::User.token,
        :oauth_token_secret => Robin::User.secret).home_timeline
    end
  end
end
