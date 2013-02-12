require 'stringio'
require 'robin'

class Runner
  def self.run(*args)
    @output_stream = StringIO.new
    @input_stream = StringIO.new
    main(@output_stream, @input_stream, args)
  end

  def self.output
    @output_stream.rewind
    @output_stream.read
  end
end
