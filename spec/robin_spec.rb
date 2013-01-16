require 'runner'
require 'vcr'


describe 'robin' do
  it "fetches the user's home timeline" do
    VCR.use_cassette('home_timeline') do
      Runner.run
      expect(Runner.output).to start_with "RT @lancewalton: Performance Related Pay for school teachers is lunacy. Pay teachers more and remove almost all performance measures."
      expect(Runner.output).to end_with "Hey @sramsay, I wonder what you'd think of http://t.co/455yw8DP in light of 'algorithmic criticism'.\n"
    end
  end

end
