module Robin::Actions
  class UnknownFlagAction
    def initialize(flag)
      @flag = flag
    end

    def execute(client, stream)
      stream.puts "Unknown flag '#{@flag}'. Try -h for help."
    end
  end
end
