Feature: Driver Rating System 
    Registered users should be able to rate drivers whenever they complete a ride    
Scenario: Successfully rate a driver
    Given that I successfully completed a ride as a passenger
    When I tap the "notification" to rate my driver
    Then rating section should appear
    When I select a score for my driver from 0 to 5 stars
    And I select zero or more qualities of the driver
    And I tap the "submit" button
    Then the rating should be submitted successfully
    And a successfull submition message should appear