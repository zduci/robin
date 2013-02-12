require 'oauth'
require_relative 'user'

class PinAuthenticator

  def self.authorize_url
    consumer = OAuth::Consumer.new(Robin::Config.key, 
                                   Robin::Config.secret,
                                   { :site => 'http://twitter.com/',                
                                     :request_token_path => '/oauth/request_token', 
                                     :access_token_path => '/oauth/access_token',   
                                     :authorize_path => '/oauth/authorize' })
    begin
      @request_token = consumer.get_request_token 
    rescue Net::HTTPRetriableError => e
      @request_token = consumer.get_request_token 
    end
    @request_token.authorize_url()
  end

  def self.authenticate(pin)
    begin
      access_token = @request_token.get_access_token(:oauth_verifier => pin)
      Robin::User.register_new(access_token.token,
                        access_token.secret)
      true
    rescue OAuth::Unauthorized => e
      false
    end
  end
end
