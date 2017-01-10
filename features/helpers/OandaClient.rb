require 'oanda_api'
require 'selenium-webdriver'
require 'net/http'
require 'uri'


module OandaClient
	API_KEY = "1BJkSBN0wifqg0gnvUiarFHn"
	URL = "https://www.oanda.com/rates/api/v1/rates/"

	def self.convert_currency(base_curreny, target_currency)
		uri = URI.parse(URL + "#{base_curreny}.json?api_key=1BJkSBN0wifqg0gnvUiarFHnecimal_places=5&date=2017-01-08&fields=averages&quote=#{target_currency}")
		@response = Net::HTTP.get_response(uri)
		puts @response.inspect
	end


end