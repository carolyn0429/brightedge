require 'oanda_api'
require 'selenium-webdriver'
require 'net/http'
require 'uri'


class OandaClient
	API_KEY = "1BJkSBN0wifqg0gnvUiarFHn"
	URL = "https://www.oanda.com/rates/api/v1/rates/"

	def convert_currency(base_curreny, target_currency)
		uri = URI.parse(URL + "#{base_curreny}.json?api_key=#{API_KEY}&decimal_places=5&date=2017-01-08&fields=averages&quote=#{target_currency}")
		@http_response = Net::HTTP.get_response(uri)
		@response = JSON.parse(@http_response.body)
		puts @response.inspect
		return @response
	end

end