require_relative 'robin/client'
require_relative 'robin/args_parser'

def main(output, input, args)
  action = Robin::ArgsParser.parse(args)
  action.execute(Robin::Client, output, input)
end

if __FILE__ == $0
  main(STDOUT, STDIN, ARGV)
end
