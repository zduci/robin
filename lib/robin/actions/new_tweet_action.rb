module Robin::Actions
  class NewTweetAction
    def initialize(text)
      @text = text
    end

    def execute(client, stream)
      stream.puts client.tweet(@text).full_text
    end
  end
end
