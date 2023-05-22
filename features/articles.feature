Feature: Articles

Scenario: Article List
	Given I have articles titled "Java3", "shravan"
	When I go to the list of articles
	Then I should see "Java3"
	And I should see "shravan"

	
Scenario: Create Valid Article
  Given I have no articles
  When I follow "New Article"
  And I fill in "article[title]" with "Program"
  And I fill in "article[body]" with "Body data"
  And I check "article[published]"
  And I select "Ruby" from "article[book_id]"
  And I click "Create Article"
  Then I should see "Article successfully created"


Scenario: Login user
	Given I am logged in as "chaudharysharwan2000@gmail.com" with password "Shravan@123"


