module Robin::Actions
  class UserTimeline
    def initialize(user = nil)
      @user = user
    end

    def execute(client, output, input)
      if @user
        timeline = client.user_timeline(@user)
      else
        timeline = client.user_timeline
      end

      timeline.each do |tweet|
        output.puts tweet.full_text
      end
    end
  end
end
