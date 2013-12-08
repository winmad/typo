Feature: Merge Articles

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And I am on the new article page
  Then "winmad" created the article "zerg" with content "Zimba"
  And I am on the new article page
  Then "fuzerg" created the article "protoss" with content "Pimba"
  
Scenario: Successfully merge articles, can see both contents and comments
  Given I added the comment "agreed" to article "zerg"
  And I added the comment "nonono" to article "protoss"
  When I am on the content page
  And I visit the edit page for article "zerg"
  Then I should see "Merge Articles"
  And I fill in "merge_with" using the id for "protoss"
  And I press "Merge"
  And I go to the home page
  And I follow "zerg"
  Then I should see "Zimba"
  Then I should see "Pimba"
  Then I should see "agreed"
  Then I should see "nonono"

Scenario: Successfully merge articles, can see only one author and one title
  When I am on the content page
  And I visit the edit page for article "zerg"
  Then I should see "Merge Articles"
  And I fill in "merge_with" using the id for "protoss"
  And I press "Merge"
  And I go to the home page
  Then I should see "zerg"
  And I should not see "protoss"
  And I go to the content page
  Then I should see "winmad"
  And I should not see "fuzerg"
  
Scenario: No option to merge if not admin
  Given I logged out
  And I visit the edit page for article "zerg"
  Then I should not see "Merge Articles"

