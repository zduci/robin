module Robin::Actions
  class HomeTimelineAction
    def execute(client, stream)
      client.home_timeline.each do |tweet|
        stream.puts tweet.full_text
      end
    end
  end
end
