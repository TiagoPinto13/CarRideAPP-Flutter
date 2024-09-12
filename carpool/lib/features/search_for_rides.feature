Feature: Search for rides
    Unregistered and registered users should be able to search for existing rides

Scenario: Successful search for rides
    Given I expect all fields to be empty
    When I provide a valid departure location
    And I provide a valid arrival location
    And I provide a date
    And I provide a valid number of passengers
    Then I should be redirected to the "Choose a ride" page
    And I should be presented with a list of the existing rides that meet the given criteria

Scenario: Search for rides with an invalid departure location
    Given I expect all fields to be empty
    When I provide an invalid departure location
    And I provide a date
    And I provide a valid number of passengers
    Then I should be remain on the "home" page
    And I should receive an Invalid departure location error message

Scenario: Search for rides with an invalid arrival location
    Given I expect all fields to be empty
    When I provide a valid departure location
    And I provide an invalid arrival location
    And I provide a date
    And I provide a valid number of passengers
    Then I should be remain on the "home" page
    And I should receive an Invalid arrival location error message

Scenario: Search for rides with an invalid number of passengers
    Given I expect all fields to be empty
    When I provide a valid departure location
    And I provide a date
    And I provide an invalid number of passengers
    Then I should be remain on the "home" page
    And I should receive an Invalid number of passengers error message