require_relative 'actions/new_tweet'
require_relative 'actions/home_timeline'
require_relative 'actions/user_timeline'
require_relative 'actions/followers'
require_relative 'actions/unknown_flag'

module Robin
  class ArgsParser
    def self.parse(args)
      if args.empty?
        Robin::Actions::HomeTimeline.new
      else
        if args[0].start_with?('-')
          if args[0] == '-i'
            if args[1]
              Robin::Actions::UserTimeline.new(args[1])
            else
              Robin::Actions::UserTimeline.new
            end
          elsif args[0] == '-t'
            Robin::Actions::NewTweet.new(args[1])
          elsif args[0] == '-fr'
            Robin::Actions::Followers.new args[1]
          elsif args[0] == '-s'
            Robin::Actions::HomeTimeline.new
          else
            Robin::Actions::UnknownFlag.new(args[0])
          end
        else
            Robin::Actions::NewTweet.new(args[0])
        end
      end
    end
  end
end
