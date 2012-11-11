require 'spec_helper'

describe "Soundreef::Request" do
  before do
    @params = {
      :song_supplier_id => 345,
      :song_guid => "4cbc20d4-1167-11e2-b5a9-12313c0866d9",
      :abc => "DEF",
      :xyz => "aBc"
    }
    @endpoint = '/song/list'
  end

  describe "#initialize" do
    it "should inject timestamp into the params hash" do
      timestamp = 1352659165
      Time.stub_chain(:now, :to_i).and_return(timestamp)

      request = Soundreef::Request.new(@endpoint, @params)
      request.params[:timestamp].should == timestamp
    end
  end

  describe "#request_string" do
    it "should build the request string correctly" do
      timestamp = 1352659165
      Time.stub_chain(:now, :to_i).and_return(timestamp)
      compiled_string = @params.merge({:timestamp => timestamp}).sort.map{|p| "#{p.first}#{p.last}"}.join.downcase

      request = Soundreef::Request.new(@endpoint, @params)
      request.request_string.should == compiled_string
    end
  end

  describe "#signature" do
    it "should build the signature correctly" do
      timestamp = 1352659165
      Time.stub_chain(:now, :to_i).and_return(timestamp)

      Soundreef.configure do |c|
        c.private_key = 'myprivatekey'
      end

      request = Soundreef::Request.new(@endpoint, @params)
      request.signature.should == '738cd140d8a0fdf5b04d8d77932cc3cd8c74fa8b5fa12258376f09eb9cc1ca68'
    end
  end

  describe "#uri" do
    it "should return http://api.soundreef.com/song/list for a song#list request" do
      request = Soundreef::Request.new(@endpoint)
      request.uri.to_s.should == 'http://api.soundreef.com/song/list'
    end

    it "should return http://foo.com/song/list when configured for a different host" do
      Soundreef.configure do |c|
        c.host = 'foo.com'
      end

      request = Soundreef::Request.new(@endpoint)
      request.uri.to_s.should == 'http://foo.com/song/list'
    end
  end
end

# <?php
# 
# function generateRequestSignature($data, $privateKey){
#     ksort($data);
#     $out = '';
#     foreach($data as $key=>$value){
#         $out .= $key.$value;
#     }
#     $out = strtolower($out);
#     return hash_hmac('sha256', $out, $privateKey);
# }
# 
# $params = array("timestamp"=>"1352659165","song_supplier_id"=>"345","song_guid"=>"4cbc20d4-1167-11e2-b5a9-12313c0866d9","abc"=>"DEF","xyz"=>"aBc");
# $key = "myprivatekey";
# echo generateRequestSignature($params, $key);
# >> 738cd140d8a0fdf5b04d8d77932cc3cd8c74fa8b5fa12258376f09eb9cc1ca68
# ?>