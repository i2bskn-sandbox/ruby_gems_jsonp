module RubyGemsJsonp
  VERSION = "0.0.1"

  class Application < Sinatra::Base
    get "/" do
      "Hello Heroku"
    end
  end
end
