# brightedge take home exam
# Author: Carolyn Hung
### Learn and applied selenium front end verification in 2 days
# setup development environment and test libraries
# add backend API verification also, have generated API TOKEN from OandA website and did research to call endpoint using cURL and integrated into codes

Feature: open a currency convert page and convert the currency

Scenario: show content title
	Given I open the home page
	When I click the content title
	Then I should see title is Currency Converter 

Scenario: show header image
	Given I open the home page 
	When I click on header logo image
	Then I should see header image on the page

Scenario: show navigation menu
	Given I open the home page 
	When I click on menu section
	Then I should see the navigation menu
	And I should see search form displayed
	And I should see language displayed
	And I should see Sign in tab 
	And I should see Open an account tab

Scenario: show footer
	Given I open the home page 
	When I click on footer image
	Then I should see footer on the page

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
		| EUR 			|   USD 		|	

Scenario: click on tab and open Historical Exchange Rates page
	Given I open the home page 
	When I click on the content tab
	Then I should see Historical Exchange Rates page open and content display

Scenario: click on tab and open Live Exchange Rates page
	Given I open the home page 
	When I click on the content tab Live Exchange Rates
	Then I should see Live Exchange Rates page open and content display

Scenario Outline: enter 0 base currency and return 0 target currency	
	Given I am a authenticated user
	When I put the 0 as amount of base currency in <base_currency>
	Then I should get 0 amount of target currency in <target_currency>
	Examples:
		| base_currency | target_currency |
		| USD		   |	CAD		   |
		| EUR 			|   USD 		|	

# back-end api
Scenario Outline: enter 1 for base currency and return a corresponding target currency	
	Given I am a authenticated user
	When I put the 1 as amount of base currency in <base_currency>
	Then I should get corresponding amount of target currency in <target_currency>
	Examples:
		| base_currency | target_currency |
		| USD		   |	CAD		   |
		| EUR 			|   USD 		|	


### Haven't implemented yet ####
Scenario Outline: section text is displayed
	Given I open the home page
	When I click the section
	Then I should see <section_text>  on the page
	Examples:
		| section_text | 
		| TRADING |
		| CURRENCY CONVERTER |
		| SOLUTIONS FOR BUSINESS |
		| RESOURCES |
Scenario Outline: section TRADING is clickable and expandable
	Given I open the home page
	When I click the TRADING section
	Then I should see sub-section is visible and 7 options displayed
	And <links> are clickable
	Examples:
			| links | 
			| Trading Overview |
			| Why OANDA |
			| Markets |
			| Platforms |
			| Tools |
			| Analysis |
			| Learn |
Scenario: base currency dropdown menu is displayed
	Given I open the home page
	When I click the Currency I Have section
	Then I should see dropdown menu displayed
Scenario: target currency dropdown menu is displayed
	Given I open the home page
	When I click the Currency I Want section
	Then I should see dropdown menu displayed
Scenario: can type and search in base currency dropdown menu
	Given I open the home page
	When I click the Currency I Have section
	Then I should see search box
	And I should be able to type on search box
Scenario: can type and search in target currency dropdown menu
	Given I open the home page
	When I click the Currency I Want section
	Then I should see search box
	And I should be able to type on search box
Scenario: breadcumb path banner is displayed
	Given I open the home page
	When I click the breadcumb section
	Then I should see breadcumb banner path displayed
Scenario Outline: breadcumb path is clickable
	Given I open the home page
	When I click the breadcumb banner path section
	Then I should see <path> on the banner path is clickable
	Examples:
		| path | 
		| Home 	|
		| Currency Tools|
Scenario: DATE for currency converter is displayed correctly
	Given I open the home page
	When I click the content section
	Then I should see calendar date is displayed
	When I click on the calendar
	Then I should see Today's date in calendar is same in DATE
# API
Scenario Outline: table for rate Details has average Bid value as displayed
	Given I open the home page
	When I click the content section
	Then I should see corresponding number displayed for <scale> on <action>
	Examples:
		| scale | action |
		| MIN | Bid |
		| AVG | Bid |
		| MAX | Bid |
		| MIN | Ask |
		| AVG | Ask |
		| MAX | Ask |
Scenario: table for rate Details is displayed 
	Given I open the home page
	When I click the content section
	Then I should see rate Details table is displayed
Scenario: graph for Recent Trends is displayed 	
	Given I open the home page
	When I click the content section
	Then I should see Recent Trends graph is displayed
Scenario Outline: radio buttons for Recent Trends are displayed and clickable
	Given I open the home page
	When I click the content section
	Then I should see 3 Recent Trends radio buttons are displayed
	And I should be able to click on button <days> days
	Examples:
		| days |
		| 30 |
		| 60 |
		| 90 |
Scenario: Interactive Graph for Recent Trends link is displayed and clickable
Scenario: social media icons are displayed 
	Given I open the home page
	When I click the social media section
	Then I should see social media icons displayed
Scenario Outline: social media icons are clickable 
	Given I open the home page
	When I click the social media section
	Then I should be able to click on <social_media>
	Examples:
		| social_media | 
		| Facebook |
		| LinkedIn |
		| Twitter |
		| YouTube |
		| Google+ |
Scenario: print link is displayed and clickable
	Given I open the home page
	When I click the print section
	Then I should see print link displayed 
	And I should be able to click the link
Scenario: links for right content side section are displayed 
	Given I open the home page
	When I click the TRY ALSO right content side section
	Then I should see 8 links displayed 

Scenario: footer menu is displayed
	Given I open the home page
	When I click the footer section
	Then I should see footer menu displayed 

Scenario: footer menu link is displayed
	Given I open the home page
	When I click the footer section
	Then I am able to click on ABOUT US item


