require_relative 'actions/new_tweet'
require_relative 'actions/home_timeline'
require_relative 'actions/user_timeline'
require_relative 'actions/followers'
require_relative 'actions/unknown_flag'
require_relative 'actions/help'
require_relative 'actions/empty_tweet'

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
            if args[1] && !args[1].empty?
              Robin::Actions::NewTweet.new(args[1])
            else
              Robin::Actions::EmptyTweet.new
            end
          elsif args[0] == '-fr'
            Robin::Actions::Followers.new args[1]
          elsif args[0] == '-s'
            Robin::Actions::HomeTimeline.new
          elsif args[0] == '-h' || args[0] == '--help'
            Robin::Actions::Help.new
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
