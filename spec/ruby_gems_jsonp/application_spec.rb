require "spec_helper"

describe RubyGemsJsonp::Application do
  let(:app) {RubyGemsJsonp::Application}
  let(:ret_data) {{status: 200, data: {name: "nginx_utils"}}}

  before do
    RubyGemsJsonp::Application.any_instance.stub(:get_json).and_return(ret_data)
  end

  describe "GET /" do
    it "should be success" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /search" do
    it "should be success" do
      get "/search?query=nginx_utils", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /gems/:gem_name" do
    it "should be success" do
      get "/gems/nginx_utils", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /gems/:gem_name/owners" do
    it "should be success" do
      get "/gems/nginx_utils/owners", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /versions/:gem_name" do
    it "should be success" do
      get "/versions/nginx_utils", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /versions/:gem_name_with_version/downloads" do
    it "should be success" do
      get "/versions/nginx_utils-0.1.0/downloads", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /versions/:gem_name_with_version/downloads/search" do
    it "should be success" do
      get "/versions/nginx_utils-0.1.0/downloads/search?from=2013-06-01&to2013-06-30", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end


  describe "GET /downloads" do
    it "should be success" do
      get "/downloads", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /downloads/top" do
    it "should be success" do
      get "/downloads/top", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /downloads/all" do
    it "should be success" do
      get "/downloads/all", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /downloads/:gem_name_with_version" do
    it "should be success" do
      get "/downloads/nginx_utils-0.1.0", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /owners/:user_handle/gems" do
    it "should be success" do
      get "/owners/i2bskn/gems", {callback: "foo"}
      expect(last_response.status).to eq(200)
    end
  end
end
