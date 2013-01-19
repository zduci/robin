require_relative 'robin/client'
require_relative 'robin/args_parser'

def main(stream, args)
  action = Robin::ArgsParser.parse(args)
  action.execute(Robin::Client, stream)
end

if __FILE__ == $0
  main(STDOUT, ARGV)
end
