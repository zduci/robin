require_relative 'actions/new_tweet_action'
require_relative 'actions/home_timeline_action'
require_relative 'actions/user_timeline_action'
require_relative 'actions/followers_action'
require_relative 'actions/unknown_flag_action'

module Robin
  class ArgsParser
    def self.parse(args)
      if args.empty?
        Robin::Actions::HomeTimelineAction.new
      else
        if args[0].start_with?('-')
          if args[0] == '-i'
            if args[1]
              Robin::Actions::UserTimelineAction.new(args[1])
            else
              Robin::Actions::UserTimelineAction.new
            end
          elsif args[0] == '-t'
            Robin::Actions::NewTweetAction.new(args[1])
          elsif args[0] == '-fr'
            Robin::Actions::FollowersAction.new args[1]
          elsif args[0] == '-s'
            Robin::Actions::HomeTimelineAction.new
          else
            Robin::Actions::UnknownFlagAction.new(args[0])
          end
        else
            Robin::Actions::NewTweetAction.new(args[0])
        end
      end
    end
  end
end
