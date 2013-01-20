module Robin::Actions
  class Followers
    def initialize(user = CURRENT_USER)
      @user = user
    end

    def execute(client, stream)
      if @user
        followers = client.followers(@user)
      else
        followers = client.followers
      end
      followers.each do |follower|
        stream.puts "#{follower.name} (#{follower.screen_name})"
      end
    end
  end
end
