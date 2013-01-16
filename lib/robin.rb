require_relative 'robin/client'

def main(stream, args)
  if args.empty?
    Robin::Client.home_timeline.each do |tweet|
      stream.puts tweet.full_text
    end
  else
    Robin::Client.user_timeline.each do |tweet|
      stream.puts tweet.full_text
    end
  end
end

if __FILE__ == $0
  main(STDOUT, ARGV)
end
