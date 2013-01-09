module Robin
  class User
    CREDENTIALS = '~/robin'

    class << self
      attr_reader :token, :secret
    end

    def self.load_credentials
      credentials = read_credentials.split('\n')
      @token = credentials[0]
      @secret = credentials[1]
    end

    def self.read_credentials
      raise NoCredentials.new unless File.exists?(CREDENTIALS)
      credentials = File.expand_path(CREDENTIALS)
      File.read(credentials)
    end
  end

  class NoCredentials < Exception
  end
end
