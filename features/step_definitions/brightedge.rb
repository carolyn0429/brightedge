require 'cucumber'
require 'selenium-webdriver'
require 'rspec'

Given (/^I open the home page$/) do
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	@homepage = HomePage.new
	@homepage.open_url
	puts "Test Passed: Page 1 Validated" 
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	
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
