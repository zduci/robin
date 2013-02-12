module Robin::Actions
  class EmptyTweet
    def execute(client, output, input)
      output.puts "You cannot tweet an empty message!"
    end
  end
end
