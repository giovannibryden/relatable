class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :relate
  helper_method :similar

  def relate
  	
    require 'net/https'
    require 'json'

    uri = URI('https://api.relateiq.com/v2/lists/53d2cd5ce4b04e37e550208a/listitems/')

    req = Net::HTTP::Get.new(uri)
    req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }

    res = res.body
    res = JSON.parse(res)['objects'][2]['fieldValues']["60"].to_json[9..-4]



  end

  def similar
  	
  end
end
