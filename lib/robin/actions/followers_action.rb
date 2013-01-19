module Robin::Actions
  class FollowersAction
    def execute(client, stream)
      client.followers.each do |follower|
        stream.puts "#{follower.name} (#{follower.screen_name})"
      end
    end
  end
end
