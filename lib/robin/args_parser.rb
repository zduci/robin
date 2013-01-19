require_relative 'actions/new_tweet_action'
require_relative 'actions/home_timeline_action'
require_relative 'actions/user_timeline_action'
require_relative 'actions/followers_action'

module Robin
  class ArgsParser
    def self.parse(args)
      if args.empty?
        Robin::Actions::HomeTimelineAction.new
      else
        if args[0].start_with?('-')
          if args[0] == '-i'
            Robin::Actions::UserTimelineAction.new
          elsif args[0] == '-t'
            Robin::Actions::NewTweetAction.new(args[1])
          elsif args[0] == '-fr'
            Robin::Actions::FollowersAction.new
          end
        else
            Robin::Actions::NewTweetAction.new(args[0])
        end
      end
    end
  end
end
