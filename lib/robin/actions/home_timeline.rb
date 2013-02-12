module Robin::Actions
  class HomeTimeline
    def execute(client, output, input)
      client.home_timeline.each do |tweet|
        output.puts tweet.full_text
      end
    end
  end
end
