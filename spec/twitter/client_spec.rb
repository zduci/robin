require 'twitter/client'

class TwitterTranslator
end

class TwitterCommunicator
end

describe Twitter::Client do
  it 'fetches newest tweets' do
    response = stub
    TwitterCommunicator.stub(:newest) { response }
    TwitterTranslator.stub(:translate_tweets).with(response) { ['a tweet', 'another'] } 
    Twitter::Client.newest.should == ['a tweet', 'another']
  end
end
