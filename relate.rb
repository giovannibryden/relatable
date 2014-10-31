
# output = `curl -X GET https://api.relateiq.com/v2/lists -u 53dc0b49e4b088619bfe48f6:g9Bb7j6XXSZYOJh5cpngznvUPtl -H 'Accept: application/json'`


require 'net/https'
require 'json'

uri = URI('https://api.relateiq.com/v2/lists/5448300ee4b0f8d6641caf91/listitems/5452cc38e4b0e8122e0f09d3')

req = Net::HTTP::Get.new(uri)
req.basic_auth '53dc0b49e4b088619bfe48f6', 'g9Bb7j6XXSZYOJh5cpngznvUPtl'

res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
  http.request(req)
}

res = res.body
puts res

	# secret
	# 41APAZarLkss6kQ5UfuAwmrPgg9

	# key
	# 53dc0b49e4b088619bfe48f6

	# curl -X GET https://api.relateiq.com/v2/lists -u 53dc0b49e4b088619bfe48f6:g9Bb7j6XXSZYOJh5cpngznvUPtl

	# list
	# 53d2cd5ce4b04e37e550208a