module Robin::Actions
  class NewTweet
    def initialize(text)
      @text = text
    end

    def execute(client, output, input)
      output.puts client.tweet(@text).full_text
    end
  end
end
