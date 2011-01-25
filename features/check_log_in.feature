Feature: Check user log in
  In order to get access
  As an user
  I want to log in

  Scenario: Willing to log in
    Given I have one user "blabla" with email "bla@wp.pl" and password "brak123"
    When I go to the login page
    And I fill in "Nazwa użytkownika" with "blabla"
    And I fill in "Hasło" with "brak123"
    And I press "Zaloguj"
    Then I should see "Signed in successfully."

  Scenario: Willing to log out
    Given I am a new, authenticated user
    When I go to the homepage
    And I follow "Wyloguj"
    Then I should see "Signed out successfully."

  Scenario: Willing to register
    Given I am not authenticated
    And I am on the homepage
    When I follow "Zarejestruj się"
    And I fill in "Nazwa użytkownika" with "user1"
    And I fill in "Email" with "user1@gmail.com"
    And I fill in "Hasło" with "secretpass"
    And I fill in "Potwierdź hasło" with "secretpass"
    And I press "Zarejestruj"
    Then I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."