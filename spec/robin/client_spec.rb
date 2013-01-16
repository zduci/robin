require 'robin/client'
require 'vcr'
require 'vcr_helper'

describe Robin::Client do
  it 'retrieves the user\'s home timeline' do
    VCR.use_cassette('home_timeline') do
      timeline = Robin::Client.home_timeline
      timeline.size.should == 20
      timeline[0].full_text.should == "RT @lancewalton: Performance Related Pay for school teachers is lunacy. Pay teachers more and remove almost all performance measures."
        timeline[19].full_text.should == "Hey @sramsay, I wonder what you'd think of http://t.co/455yw8DP in light of 'algorithmic criticism'."
    end
  end
end

