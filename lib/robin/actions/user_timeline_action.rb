module Robin::Actions
  class UserTimelineAction
    def execute(client, stream)
      client.user_timeline.each do |tweet|
        stream.puts tweet.full_text
      end
    end
  end
end
