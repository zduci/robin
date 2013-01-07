class Runner
  def self.run
  end
end

describe 'robin' do
  it 'fetches twitter stream' do
    Runner.run.should == "tweets go here\nand here"
  end
end
