Feature: Articles

Scenario: Login user
  Given I am logged in as "chaudharysharwan2000@gmail.com" with password "Shravan@123"

Scenario: Article List
	Given I have articles titled "Java3", "shravan"
	When I go to the list of articles
	Then I should see "Java3"
	And I should see "shravan"

	
Scenario: Create Valid Article
  Given I have some articles
  When I follow "New Article"
  Then I should be on the new article page with "chaudharysharwan2000@gmail.com" and password "Shravan@123"
  And I fill in "article[title]" with "Program"
  And I fill in "article[body]" with "Body data should be long"
  And I check "article[published]"
  And I click "Create Article"
  Then I should see "Program"