module Robin::Actions
  class EmptyTweet
    def execute(client, stream)
      stream.puts "You cannot tweet an empty message!"
    end
  end
end
