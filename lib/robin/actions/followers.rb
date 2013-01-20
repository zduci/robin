module Robin::Actions
  class Followers
    def initialize(user = nil)
      @user = user
    end

    def execute(client, stream)
      begin
        if @user
          followers = client.followers(@user)
        else
          followers = client.followers
        end
        followers.each do |follower|
          stream.puts "#{follower.name} (#{follower.screen_name})"
        end
      rescue Twitter::Error::NotFound => e
        stream.puts "This user does not exist"
      end
    end
  end
end
