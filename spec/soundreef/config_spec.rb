require 'spec_helper'

describe "Soundreef::Configuration" do
  context "when only a public key is supplied" do
    it "private key should be nil" do
      test_public_key = 'mypublickey'

      Soundreef.configure do |c|
        c.public_key = test_public_key
      end

      Soundreef.config.public_key.should == test_public_key
      Soundreef.config.private_key.should be_nil
    end
  end
  
  context "when public and private keys supplied" do
    it "should be configured" do
      test_public_key = 'mypublickey'
      test_private_key = 'myprivatekey'

      Soundreef.configure do |c|
        c.public_key = test_public_key
        c.private_key = test_private_key
      end

      Soundreef.config.public_key.should == test_public_key
      Soundreef.config.private_key.should == test_private_key
    end
  end
end