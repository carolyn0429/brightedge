# brightedge take home exam
Feature: open a currency convert page and convert the currency

Scenario: show content title
	Given I open the home page
	When I click the content title
	Then I should see title is Currency Converter 

# Scenario: show header image
# 	Given I open the home page 
# 	Then I should see header image on the page

# Scenario: show header image
# 	Given I open the home page 
# 	Then I should see header image on the page

# Scenario: show navigation menu
# 	Given I open the home page 
# 	Then I should see the navigation menu

# Scenario: show footer
# 	Given I open the home page 
# 	Then I should see footer on the page

Scenario: show content tab
	Given I open the home page 
	When I see the grey content tab
	Then I should see title is Currency Converter
 
Scenario Outline: display currency convertion
	Given I open the home page
	When I click on text field of currency I have 
	When I enter currency with amount 1 in <base_currency>
	Then I should see corresponding currency I want with amount in <target_currency>
	Examples:
		| base_currency | target_currency |
		| USD		   |	CAD		   |	

Scenario: click on tab and open Historical Exchange Rates page
	Given I open the home page 
	When I click on the content tab Historical Exchange Rates
	Then I should see the page open and content display

Scenario: click on tab and open Live Exchange Rates page
	Given I open the home page 
	When I click on the content tab Live Exchange Rates
	Then I should see the page open and content display

@api
Scenario: enter a base currency and return a target currency	
	Given I am a authenticated user
	When I put the 1 as amount of base currency in USD
	Then I should get corresponding amount of target currency in CAD


