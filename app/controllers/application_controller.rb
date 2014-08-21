class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :relate_website
  helper_method :relate_account
  helper_method :relate_length
  helper_method :relate

  # One method to rule them all, one if else statement to bind them

  def relate(num,value)
    
    require 'net/https'
    require 'json'

    uri = URI('https://api.relateiq.com/v2/lists/53d2cd5ce4b04e37e550208a/listitems?_start=0&_limit=5')

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
      website = JSON.parse(res)['objects'][num]['fieldValues']["60"].to_json[9..-4]
    elsif value === "length" then
      length = JSON.parse(res)['objects'].length()
    elsif value === "name" then
      length = JSON.parse(res)['objects'][num]['name']
    else
      return "Value is invalid"
    end
      
  end

  # def relate_website(num)
  	
  #   require 'net/https'
  #   require 'json'

  #   uri = URI('https://api.relateiq.com/v2/lists/53d2cd5ce4b04e37e550208a/listitems/')

  #   req = Net::HTTP::Get.new(uri)
  #   req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

  #   res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
  #     http.request(req)
  #   }

  #   # Get name of website. 
    
  #   res = res.body
  #   website = JSON.parse(res)['objects'][num]['fieldValues']["60"].to_json[9..-4]

  # end

  # def relate_account(num)

  #   require 'net/https'
  #   require 'json'

  #   uri = URI('https://api.relateiq.com/v2/lists/53d2cd5ce4b04e37e550208a/listitems/')

  #   req = Net::HTTP::Get.new(uri)
  #   req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

  #   res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
  #     http.request(req)
  #   }

  #   # Get account ID

  #   res = res.body
  #   account = JSON.parse(res)['objects'][num]['accountId']

  # end

  # def relate_length

  #   require 'net/https'
  #   require 'json'

  #   uri = URI('https://api.relateiq.com/v2/lists/53d2cd5ce4b04e37e550208a/listitems/')

  #   req = Net::HTTP::Get.new(uri)
  #   req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

  #   res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
  #     http.request(req)
  #   }

  #   # Get number of leads

  #   res = res.body
  #   length = JSON.parse(res)['objects'].length()

  # end
end
