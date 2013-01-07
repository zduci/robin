require 'open3'

class Runner
  ROBIN = File.expand_path('../lib/robin.rb', File.dirname(__FILE__))

  def self.run
    stdin, stdout, stderr = Open3.popen3('ruby', ROBIN)
    return stderr.gets if stderr
    stdout.gets
  end
end
