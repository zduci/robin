module Robin
  class User
    CREDENTIALS = File.expand_path('~/.robin')

    class << self
      attr_reader :token, :secret
    end

    def self.load_credentials
      credentials = read_credentials.split(/\n/)
      @token = credentials[0]
      @secret = credentials[1]
    end

    def self.read_credentials
      raise NoCredentials.new unless File.exists?(CREDENTIALS)
      credentials = File.expand_path(CREDENTIALS)
      File.read(credentials)
    end

    def self.register_new(token, secret)
      write_credentials(token, secret)
      load_credentials
    end

    private
    def self.write_credentials(token, secret)
      File.open(CREDENTIALS, 'w') do |file|
        file.write("#{token}\n#{secret}")
      end
    end
  end

  class NoCredentials < Exception
  end
end
