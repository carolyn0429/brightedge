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

end