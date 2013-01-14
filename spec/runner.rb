require 'stringio'
require 'robin'

class Runner
  def self.run
    @stream = StringIO.new
    main(@stream)
  end

  def self.output
    @stream.rewind
    @stream.read
  end
end
