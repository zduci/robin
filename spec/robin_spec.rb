require 'runner'
require 'vcr'
require 'vcr_helper'

describe 'robin' do
  it "prints the user's home timeline" do
    VCR.use_cassette('home_timeline') do
      Runner.run
      expect(Runner.output).to start_with "RT @lancewalton: Performance Related Pay for school teachers is lunacy. Pay teachers more and remove almost all performance measures."
      expect(Runner.output).to end_with "Hey @sramsay, I wonder what you'd think of http://t.co/455yw8DP in light of 'algorithmic criticism'.\n"
    end
  end

  it "prints the user's latest tweets" do
    VCR.use_cassette('user_timeline') do
      Runner.run(['-i'])
      expect(Runner.output).to start_with "please make the gaga stop"
      expect(Runner.output).to end_with "set -o vi\n"
    end
  end

  it "tweets and prints the tweet" do
    VCR.use_cassette('new_tweet') do
      Runner.run(['-t', 'test'])
      expect(Runner.output).to eq "test\n"

      Runner.run(['-i'])
      expect(Runner.output).to start_with 'test'
    end
  end

  it "tweets without the -t flag" do
    VCR.use_cassette('new_tweet') do
      Runner.run(['test'])
      expect(Runner.output).to eq "test\n"

      Runner.run(['-i'])
      expect(Runner.output).to start_with 'test'
    end
  end

  it "prints the user's followers" do
    VCR.use_cassette('user_followers') do
      Runner.run(['-fr'])
      expect(Runner.output).to start_with "Sang Jakob (Carleyahoj)"
      expect(Runner.output).to end_with "Syprian (siopenschtein)\n"
    end
  end
end
