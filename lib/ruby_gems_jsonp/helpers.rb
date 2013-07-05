module RubyGemsJsonp
  module Helpers
    def get_json(url, options={})
      uri = URI.parse(url)
      path = uri.path
      unless options.empty?
        path += "?#{options.inject([]){|q,(k,v)| q << "#{k}=#{v}"}.join("&")}"
      end
      req = Net::HTTP::Get.new(path)
      res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req)}
      begin
        data = JSON.parse(res.body)
      rescue
        data = "parse error"
      end
      {status: res.response.code, data: data}
    end
  end
end
