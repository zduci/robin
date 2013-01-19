require 'robin/client'
require 'vcr'
require 'vcr_helper'

describe Robin::Client do
  it "retrieves the user's home timeline" do
    VCR.use_cassette('home_timeline') do
      timeline = Robin::Client.home_timeline
      timeline.size.should == 20
      timeline[0].full_text.should == "RT @lancewalton: Performance Related Pay for school teachers is lunacy. Pay teachers more and remove almost all performance measures."
      timeline[19].full_text.should == "Hey @sramsay, I wonder what you'd think of http://t.co/455yw8DP in light of 'algorithmic criticism'."
    end
  end

  it "retrieves the user's own timeline" do
    VCR.use_cassette('user_timeline') do
      timeline = Robin::Client.user_timeline
      timeline.size.should == 20
      timeline[0].full_text.should == "please make the gaga stop"
      timeline[19].full_text.should == "set -o vi"
    end
  end

  it "tweets a new tweet" do
    VCR.use_cassette('new_tweet') do
      Robin::Client.tweet('test')
      Robin::Client.user_timeline.first.full_text.should == 'test'
    end
  end

  it "retrieves the user's followers" do
    VCR.use_cassette('user_followers') do
      followers = Robin::Client.followers
      followers[0].name.should == "Sang Jakob"
      followers[14].name.should == "Duncan Grant"
    end
  end

  it "retrieves another user's followers" do
    VCR.use_cassette('another_user_followers') do
      followers = Robin::Client.followers("carvalho82")
      followers[0].name.should == "Gill Gillies"
      followers[1].name.should == "Ros McDonagh"
    end
  end
end
