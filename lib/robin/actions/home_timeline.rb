module Robin::Actions
  class HomeTimeline
    def execute(client, stream)
      client.home_timeline.each do |tweet|
        stream.puts tweet.full_text
      end
    end
  end
end
