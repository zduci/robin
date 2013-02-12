require 'robin/user.rb'

describe Robin::User do
  it 'reads the user credentials' do
    Robin::User.stub(:read_credentials) { "token\nsecret" }
    Robin::User.load_credentials
    Robin::User.token.should == 'token'
    Robin::User.secret.should == 'secret'
  end

  it 'can register a new user' do
    Robin::User.stub(:CREDENTIALS) { File.expand_path("./../fixtures/credentials") }
    Robin::User.register_new('new token', 'new secret')
    Robin::User.token.should == 'new token'
    Robin::User.secret.should == 'new secret'
  end

  it 'raises an exception is there are no user credentials' do
    File.stub(:exists?) { false }
    lambda { Robin::User.load_credentials }.should raise_error Robin::NoCredentials
  end
end
