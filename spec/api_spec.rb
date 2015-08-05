require "spec_helper"

module PeopleHR
  describe API do
    let(:stubs) { Faraday::Adapter::Test::Stubs.new }
    let(:test) do
      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    end

    let(:api_key) { "abc123abc123abc123" }

    let(:api) { API.new(api_key: api_key, connection: test) }

    it "knows the root API URL" do
      expect(API::API_ROOT.to_s).to eq("https://api.peoplehr.net/")
    end

    describe "#request" do
      it "makes an API request" do
        stubs.post("/") { |env| [200, {}, '{ "isError": false }'] }

        response = api.request("GetAllEmployeeDetail")
        expect(response).to eq({ "isError" => false })
      end

      it "handles malformed JSON" do
        stubs.post("/") { |env| [200, {}, '{ malformed: yes'] }

        expect{api.request("GetAllEmployeeDetail")}.to raise_error(API::BadResponse)
      end
    end
  end
end
