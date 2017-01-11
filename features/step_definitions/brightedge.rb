require 'cucumber'
require 'selenium-webdriver'
require 'rspec'

Given (/^I open the home page$/) do
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	@homepage = HomePage.new
	@homepage.open_url
	puts "[LOG]: This page is validated..." 
	wait = Selenium::WebDriver::Wait.new(:timeout => 10)

end

When (/^I click the content title$/) do
	@element = @homepage.find_elemnt(:tag_name, "h1")
end

When (/^I click on text field of currency I have$/) do
	@element = @homepage.find_elemnt(:id, "quote_amount_input")
end

When (/^I see the grey content tab$/) do
	@element = @homepage.find_elemnt(:class, "grey_tab_selected")
end

Then (/^I should see title is Currency Converter$/) do
	expect(@element.text).to include("Currency Converter")
end

When (/^I enter currency with amount (.*) in (.*)$/) do |amount, base_currency|
	@element.send_keys(amount)
	
end

When (/^I click on the content tab$/) do
	@element = @homepage.find_elemnt(:class, "grey_tab")
	puts @element
end

When (/^I click on menu section$/) do
	@element_list = @homepage.find_elemnt(:id, "hamburger")
end

When (/^I click on language on menu section$/) do
	@element = @homepage.find_elemnt(:id, "m-lang")
end

And (/^I should see search form displayed$/) do
	@element = @element_list.find_elemnt(:tag_name, "form")
	expect(@element.displayed).to_be true
end

When (/^I click on footer image$/) do	
	@element = @homepage.find_elemnt(:xpath, "//img[@src='/wandacache/oanda-footer-04e54f470c9c0b69e08518aed239cb1374fea2bb.png']")
end

When (/^I click on header logo image$/) do
	@element = @homepage.find_elemnt(:xpath, "//img[@src='/wandacache/logo-0f4bd3dd5ad4f6b4fefa3b182838e42c7b2e4e6d.svg']")
end

Then (/^I should see header image on the page$/) do
	@element.displayed? == true
end

Then (/^I should see footer on the page$/) do
	@element.displayed? == true
end

And (/^I should see language displayed$/) do
	@element.text == "EN"
end

And (/^I should see (.*) tab$/) do |pattern|
	@sing_in = @element.find_elemnt(:id, "w-signin")
	expect(@sing_in.text).to include (pattern.to_s)
end 

And (/^I should see language options dropdown menu displayed$/) do
	@options = @element.find_elemnt(:id, 'lang-options')
	@options.each { |option| @option.click if @option.text == 'DE' }
end

Then (/^I should see Live Exchange Rates page open and content display$/) do
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	  element = @element.find_element(:xpath, "//a[@tabindex='3']")
	  puts element
	  expect(element.text).to include("Live Exchange Rates")
	  element.click
end

Then (/^I should see Historical Exchange Rates page open and content display$/) do
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	  element = @element.find_element(:xpath, "//a[@tabindex='2']")
	  puts element
	  expect(element.text).to include("Historical Exchange Rates")
	  element.click
end

Given (/^I am a authenticated user$/) do
	@client = OandaClient.new
	puts "[INFO]: Initialize an Oanda client..."
end

When (/^I put the 1 as amount of base currency in (.*)$/) do |base_currency|
	@base_currency = base_currency
end

Then (/^I should get corresponding amount of target currency in (.*)$/) do |target_currency|
	@response = @client.convert_currency(@base_currency,target_currency)
	puts @response['meta']['effective_params']
	expect(@response['meta']['effective_params']['quote_currencies'].to_s).to include(target_currency.to_s)
	expect(@response['quotes']["#{target_currency}"]['ask'].to_s).not_to be_nil
	expect(@response['quotes']["#{target_currency}"]['bid'].to_s).not_to be_nil
	puts "[INFO]: Successfully converting #{@base_currency} to #{target_currency}..."
end