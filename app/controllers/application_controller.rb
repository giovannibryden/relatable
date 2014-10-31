class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :relate
  helper_method :similar

  # One method to rule them all, one if else statement to bind them

  def relate(num,value)

    require 'net/https'
    require 'json'

    uri = URI('https://api.relateiq.com/v2/lists/5448300ee4b0f8d6641caf91/listitems')
    req = Net::HTTP::Get.new(uri)
    req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }

    res = res.body

    # Logic to pick between one value or the other based on parameter being passed

    if value === "account" then
      account = JSON.parse(res)['objects'][num]['accountId']
    elsif value === "website" then
      website = JSON.parse(res)['objects'][num]['fieldValues']["8"].to_json[9..-4]
      if website.nil?
        website = "N/A"
      else
        website = website
      end
    elsif value === "length" then
      length = JSON.parse(res)['objects'].length()
    elsif value === "name" then
      name = JSON.parse(res)['objects'][num]['name']
    else
      return "Value is invalid"
    end
  end

  # Method to grab traffic based on website passed.
  def similar(website)

    uri = URI("http://api.similarweb.com/Site/"+website+"/v1/EstimatedTraffic?Format=JSON&UserKey=45e195d928eed346a2dc5d162fe9b639")
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }

    res = res.body  

    return res.to_json[24..-5]

  end
end
