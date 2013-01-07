module Twitter
  class Client
    def self.newest
      response = TwitterCommunicator.newest
      TwitterTranslator.translate_tweets(response)
    end
  end
end
