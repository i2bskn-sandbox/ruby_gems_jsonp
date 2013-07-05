require "ruby_gems_jsonp/helpers"

module RubyGemsJsonp
  VERSION = "0.0.1"

  class Application < Sinatra::Base

    API = "http://rubygems.org/api/v1"

    configure do
      set :root, File.expand_path("../../..", __FILE__)
    end

    helpers do
      include Sinatra::Jsonp
      include Helpers
    end

    get "/" do
      "Hello Heroku"
    end

    get "/search" do
      jsonp get_json("#{API}/search.json", params.select{|k,v| k =~ /^query$/})
    end

    get "/gems/:gem_name" do
      jsonp get_json("#{API}/gems/#{params[:gem_name]}.json")
    end

    get "/gems/:gem_name/owners" do
      jsonp get_json("#{API}/gems/#{params[:gem_name]}/owners.json")
    end

    get "/versions/:gem_name" do
      jsonp get_json("#{API}/versions/#{params[:gem_name]}.json")
    end

    get "/versions/:gem_name_with_version/downloads" do
      jsonp get_json("#{API}/versions/#{params[:gem_name_with_version]}/downloads.json")
    end

    get "/versions/:gem_name_with_version/downloads/search" do
      jsonp get_json("#{API}/versions/#{params[:gem_name_with_version]}/downloads/search.json", params.select{|k,v| k =~ /^(?:from|to)$/})
    end

    get "/downloads" do
      jsonp get_json("#{API}/downloads.json")
    end

    get "/downloads/top" do
      jsonp get_json("#{API}/downloads/top.json")
    end

    get "/downloads/all" do
      jsonp get_json("#{API}/downloads/all.json")
    end

    get "/downloads/:gem_name_with_version" do
      jsonp get_json("#{API}/downloads/#{params[:gem_name_with_version]}.json")
    end

    get "/owners/:user_handle/gems" do
      jsonp get_json("#{API}/owners/#{params[:user_handle]}/gems.json")
    end
  end
end
