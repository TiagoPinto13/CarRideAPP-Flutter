Feature: Passenger Rating System
    Registered users should be able to rate passengers when completed a ride  
Scenario: Successfully rated a passenger
    Given that I successfully completed a ride
    And I tap the "notification" to rate my passengers
    Then a rating section should appear
    And I select a score for my passengers from 0 to 5 stars
    And I select zero or more qualities of the passenger
    And I tap the "submit" button
    Then the rating should be submitted successfully
    And a successful submition message should appear