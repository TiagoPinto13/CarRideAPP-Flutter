Feature: Sheduling a ride
    Registered users should be able to schedule a new ride

Scenario: Successful sheduling a ride
    Given I am in the "publish" page
    When I provide a valid departure location
    And I provide a valid arrival location
    And I provide a date
    And I provide a valid departure time
    And I provide a valid number of passengers
    And I provide a car model
    And I tap on the "publish" button
    Then I should be presented with a successful publication message
    
Scenario: Sheduling a ride with an invalid departure location
    Given I am in the "publish" page
    When I provide an invalid departure location
    And I provide a valid arrival location
    And I provide a date
    And I provide a valid departure time
    And I provide a valid number of passengers
    And I provide a car model
    And I tap on the "publish" button
    Then I should be presented with an invalid departure location error message

Scenario: Sheduling a ride with an invalid arrival location
    Given I am in the "publish" page
    When I provide a valid departure location
    And I provide an invalid arrival location
    And I provide a date
    And I provide a valid departure time
    And I provide a valid number of passengers
    And I provide a car model
    And I tap on the "publish" button
    Then I should be presented with an invalid arrival location error message

Scenario: Sheduling a ride with an invalid departure time
    Given I am in the "publish" page
    When I provide a valid departure location
    And I provide a valid arrival location
    And I provide a date
    And I provide an invalid departure time
    And I provide a valid number of passengers
    And I provide a car model
    And I tap on the "publish" button
    Then I should be presented with an invalid departure time error message

Scenario: Sheduling a ride with an invalid number of passengers
    Given I am in the "publish" page
    When I provide a valid departure location
    And I provide a valid arrival location
    And I provide a date
    And I provide a valid departure time
    And I provide an invalid number of passengers
    And I provide a car model
    And I tap on the "publish" button
    Then I should be presented with an invalid number of passengers error message
    