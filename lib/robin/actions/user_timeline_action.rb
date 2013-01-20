module Robin::Actions
  class UserTimelineAction
    def initialize(user = nil)
      @user = user
    end

    def execute(client, stream)
      if @user
        timeline = client.user_timeline(@user)
      else
        timeline = client.user_timeline
      end

      timeline.each do |tweet|
        stream.puts tweet.full_text
      end
    end
  end
end
