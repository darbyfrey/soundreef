require 'spec_helper'

describe "Soundreef::Request" do
  before do
    @params = {
      :song_supplier_id => 345,
      :song_guid => "4cbc20d4-1167-11e2-b5a9-12313c0866d9",
      :abc => "DEF",
      :xyz => "aBc"
    }
  end

  describe "#request_string" do
    it "should build the request string correctly" do
      compiled_string = @params.sort.map{|p| "#{p.first}#{p.last}"}.join.downcase

      request = Soundreef::Request.new(@params)
      request.request_string.should == compiled_string
    end
  end

  describe "#signature" do
    it "should build the signature correctly" do
      Soundreef.configure do |c|
        c.private_key = 'myprivatekey'
      end

      request = Soundreef::Request.new(@params)
      request.signature.should == '8b4ac8a9c249e9e28d255dfe50fbb6c2199ac62370807b0dfc8e855fd6e2790e'
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
# $params = array("song_supplier_id"=>"345","song_guid"=>"4cbc20d4-1167-11e2-b5a9-12313c0866d9","abc"=>"DEF","xyz"=>"aBc");
# $key = "myprivatekey";
# echo generateRequestSignature($params, $key);
# >> 8b4ac8a9c249e9e28d255dfe50fbb6c2199ac62370807b0dfc8e855fd6e2790e
# ?>