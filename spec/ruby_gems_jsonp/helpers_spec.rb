require "spec_helper"

describe RubyGemsJsonp::Helpers do
  include RubyGemsJsonp::Helpers

  describe "#get_json" do
    let(:ret_data) {'[{"name":"nginx_utils","downloads":1388,"version":"0.1.1","version_downloads":130,"platform":"ruby","authors":"i2bskn","info":"The various utilities on nginx","project_uri":"http://rubygems.org/gems/nginx_utils","gem_uri":"http://rubygems.org/gems/nginx_utils-0.1.1.gem","homepage_uri":"https://github.com/i2bskn/nginx_utils","wiki_uri":null,"documentation_uri":null,"mailing_list_uri":null,"source_code_uri":null,"bug_tracker_uri":null,"dependencies":{"development":[{"name":"bundler","requirements":"~> 1.3"},{"name":"rake","requirements":">= 0"},{"name":"rspec","requirements":">= 0"}],"runtime":[{"name":"thor","requirements":">= 0"}]}}]'}

    # Mocks
    let(:req_m) {double("request mock").as_null_object}
    let(:res_m) {double("response mock")}
    let(:stat_m) {double("status mock")}

    context "with http success" do
      before do
        stat_m.stub(:code).and_return(200)
        res_m.stub(:body).and_return(ret_data)
        res_m.stub(:response).and_return(stat_m)
        Net::HTTP::Get.stub(:new).and_return(req_m)
        Net::HTTP.stub(:start).and_return(res_m)
      end

      let(:json) {get_json("http://example.com/api/v1/search.json", query: "nginx_utils")}

      it "hash should be returned" do
        expect(json.is_a? Hash).to be_true
      end

      it "status should be defined" do
        expect(json.has_key? :status).to be_true
        expect(json[:status]).to eq(200)
      end

      it "data should be defined" do
        expect(json.has_key? :data).to be_true
        # type changes by ret_data
        expect(json[:data].is_a? Array).to be_true
      end

      it "data should be string if JSON::ParseError" do
        JSON.should_receive(:parse).and_raise(JSON::ParserError)
        expect(json[:data]).to eq("parse error")
      end

      it "params should be converted to query-strings" do
        Net::HTTP::Get.should_receive(:new).with("/api/v1/search.json?query=nginx_utils")
        get_json("http://example.com/api/v1/search.json", query: "nginx_utils")
      end
    end

    context "with bad request" do
      before do
        stat_m.stub(:code).and_return(400)
        res_m.stub(:body).and_return("Request is missing param :query")
        res_m.stub(:response).and_return(stat_m)
        Net::HTTP::Get.stub(:new).and_return(req_m)
        Net::HTTP.stub(:start).and_return(res_m)
      end

      let(:json) {get_json("http://example.com/api/v1/search.json")}

      it "hash should be returned" do
        expect(json.is_a? Hash).to be_true
      end

      it "status should be defined" do
        expect(json.has_key? :status).to be_true
        expect(json[:status]).to eq(400)
      end

      it "data should be defined" do
        expect(json.has_key? :data).to be_true
        expect(json[:data]).to eq("parse error")
      end
    end
  end
end
