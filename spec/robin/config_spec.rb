require 'robin/config'

describe Robin::Config do
  it 'stores consumer keys' do
    Robin::Config.key.should == 'WgyUHBHODrfuzwGYdfukw'
    Robin::Config.secret.should == '7MdWF7SXLTICfToz118RhHV07eMXKakbWmyIhlKE'
  end
end
