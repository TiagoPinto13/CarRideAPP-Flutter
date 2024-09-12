Feature: Log in
    Registered users should be able to log in the app.

Scenario: Successful Log in
    Given I expect not to be logged in
    When I provide a valid email address
    And I provide a valid password
    And I tap the "Log in" button
    Then I should be logged in
    And I should receive a successful log in message
    And I should be redirected to the "home" page

Scenario: Log in with an invalid email
    Given I expect not to be logged in
    When I provide an invalid email address
    And I provide a valid password
    And I tap the "Log in" button
    Then I should not be logged in
    And I should receive a Invalid email error message
    And I should remain on the "log in" page

Scenario: Log in with an invalid password
    Given I expect not to be logged in
    When I provide a valid email address
    And I provide an invalid password
    And I tap the "Log in" button
    Then I should not be logged in
    And I should receive a Invalid password error message
    And I should remain on the "log in" page