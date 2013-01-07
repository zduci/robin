class Client
  def self.newest
  end
end

describe Client do
  it 'fetches newest tweets' do
    Client.newest.should == ['a tweet', 'another']
  end
end
