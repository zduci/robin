require_relative 'actions/new_tweet'
require_relative 'actions/home_timeline'
require_relative 'actions/user_timeline'
require_relative 'actions/followers'
require_relative 'actions/unknown_flag'
require_relative 'actions/help'
require_relative 'actions/empty_tweet'

module Robin
  class ArgsParser
    USER_TIMELINE = ['i']
    NEW_TWEET = ['t']
    FOLLOWERS = ['fr']
    HOME_TIMELINE = ['s']
    HELP = ['h', '-help']

    def self.parse(args)
      if args.empty?
        Robin::Actions::HomeTimeline.new
      else
        parse_args(args)
      end
    end

    private

    def self.parse_args(args)
      if args[0].start_with?('-')
        using_flag(args)
      else
        Robin::Actions::NewTweet.new(args[0])
      end
    end

    def self.using_flag(args)
      flag = args[0][1..args[0].length]
      option = args[1]

      if USER_TIMELINE.include?(flag)
        Robin::Actions::UserTimeline.new(option)
      elsif NEW_TWEET.include?(flag)
        tweet(option)
      elsif FOLLOWERS.include?(flag)
        followers(option)
      elsif HOME_TIMELINE.include?(flag)
        Robin::Actions::HomeTimeline.new
      elsif HELP.include?(flag)
        Robin::Actions::Help.new
      else
        Robin::Actions::UnknownFlag.new(flag)
      end
    end

    def self.tweet(option)
      if option && !option.empty?
        Robin::Actions::NewTweet.new(option)
      else
        Robin::Actions::EmptyTweet.new
      end
    end

    def self.followers(option)
      Robin::Actions::Followers.new(option)
    end
  end
end
