require 'oanda_api'
require 'selenium-webdriver'

module CurrencyConvertHelper
	URL = "https://www.oanda.com/currency/converter/"

	$driver = Selenium::WebDriver.for :chrome

	def self.open_url
		$driver.get URL
	end

	def self.find_element(finder, location)
		$driver.find_element(finder, location)
	end

	def get_price_quote
		client = OandaAPI::Client::TokenClient.new(:practice, "practice_account_token")
		account = client.account(12345).get

		prices = client.prices(instruments: %w(EUR_USD USD_JPY)).get

		prices.each do |p|
		  p.instrument       # => "EUR_USD"
		  p.ask              # => 1.13781
		  p.bid              # => 1.13759
		  p.time             # => 2015-01-27 21:01:13 UTC
		end
	end
end