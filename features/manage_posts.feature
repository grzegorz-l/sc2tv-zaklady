Feature: Checking posts

  Scenario: Creating posts
    Given I am an admin
    And I have no posts
    When I go to the new post page
    And I fill in "Tytuł" with "Tytuł"
    And I fill in "Krótki opis" with "To jets krótki opis"
    And I fill in "Pełen opis" with "Więcej informacji"
    And I press "Zapisz"
    Then I should have 1 post
    And I should see "Post został utworzony."
