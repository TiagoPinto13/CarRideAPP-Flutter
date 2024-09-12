Feature: User registration
    Unregistered users should be able to register in the app.

Scenario: Successful registration
    Given I expect to be unregistered
    When I provide a valid email
    And I provide a valid name
    And I provide a valid username
    And I provide a valid password
    And I provide a valid confirmation password
    And I tap the "Sign Up" button
    Then I should be successfully registered
    And I should receive a successful registration message
    And I should be redirected to the "home" page


Scenario: Registration with an invalid email
    Given I expect to be unregistered
    When I provide an invalid email
    And I provide a valid name
    And I provide a valid username
    And I provide a valid password
    And I provide a valid confirmation password
    And I tap the "Sign Up" button
    Then I should not be registered
    And I should receive an invalid email error message
    And I should remain on the "registration" page


Scenario: Registration with an invalid name
    Given I expect to be unregistered
    When I provide a valid email
    And I provide an invalid name
    And I provide a valid username
    And I provide a valid password
    And I provide a valid confirmation password
    And I tap the "Sign Up" button
    Then I should not be registered
    And I should receive an invalid name error message
    And I should remain on the "registration" page


Scenario: Registration with an invalid username
    Given I expect to be unregistered
    When I provide a valid email
    And I provide a valid name
    And I provide an invalid username
    And I provide a valid password
    And I provide a valid confirmation password
    And I tap the "Sign Up" button
    Then I should not be registered
    And I should receive an invalid username error message
    And I should remain on the "registration" page


Scenario: Registration with an invalid password
    Given I expect to be unregistered
    When I provide a valid email
    And I provide a valid name
    And I provide a valid username
    And I provide an invalid password
    And I provide a valid confirmation password
    And I tap the "Sign Up" button
    Then I should not be registered
    And I should receive an invalid password error message
    And I should remain on the "registration" page


Scenario: Registration with an invalid confirmation password
    Given I expect to be unregistered
    When I provide a valid email
    And I provide a valid name
    And I provide a valid username
    And I provide a valid password
    And I provide an invalid confirmation password
    And I tap the "Sign Up" button
    Then I should not be registered
    And I should receive an passwords do not coincide message
    And I should remain on the "registration" page