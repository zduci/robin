require 'stringio'
require 'robin'

class Runner
  def self.run(*args)
    @stream = StringIO.new
    main(@stream, args)
  end

  def self.output
    @stream.rewind
    @stream.read
  end
end
