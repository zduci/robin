module Robin
  class User
    class << self
      attr_reader :token, :secret
    end

    def self.load_credentials
      credentials = read_credentials.split('\n')
      @token = credentials[0]
      @secret = credentials[1]
    end

    def self.read_credentials
      credentials = File.expand_path('~/.robin')
      File.read(credentials)
    end
  end
end
