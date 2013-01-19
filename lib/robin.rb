require_relative 'robin/client'

def main(stream, args)
  if args.empty?
    Robin::Client.home_timeline.each do |tweet|
      stream.puts tweet.full_text
    end
  else
    if args[0].start_with?('-')
      if args[0] == '-i'
        Robin::Client.user_timeline.each do |tweet|
          stream.puts tweet.full_text
        end
      elsif args[0] == '-t'
        stream.puts Robin::Client.tweet(args[1]).full_text
      end
    else
        stream.puts Robin::Client.tweet(args[0]).full_text
    end
  end
end

if __FILE__ == $0
  main(STDOUT, ARGV)
end
