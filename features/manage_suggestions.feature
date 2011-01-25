Feature: Checking suggestions

  Scenario: Creating suggestion
    Given I am a new, authenticated user
    When I go to the homepage
    And I follow "Zaproponuj pojedynek"
    And I fill in "Drużyna 1" with "drużyna 1"
    And I fill in "Drużyna 2" with "drużyna 2"
    And I fill in "Link" with "www.link.com"
    And I press "Potwierdź"
    Then I should see "Sugestia została wysłana"