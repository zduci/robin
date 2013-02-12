module Robin::Actions
  class UnknownFlag
    def initialize(flag)
      @flag = flag
    end

    def execute(client, output, input)
      output.puts "Unknown flag '#{@flag}'. Try -h for help."
    end
  end
end
