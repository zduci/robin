require_relative 'robin/client'

def main(stream = STDOUT)
  Robin::Client.home_timeline.each do |tweet|
    stream.puts tweet.full_text
  end
end

if __FILE__ == $0
  main()
end
