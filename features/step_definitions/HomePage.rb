class HomePage
	extend CurrencyConvertHelper

	def open_url
		CurrencyConvertHelper::open_url
	end

	def find_elemnt(finder, location)
		CurrencyConvertHelper::find_element(finder, location)
	end

end