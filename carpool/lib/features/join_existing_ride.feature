Feature: Join existing rides
    Registered users should be able to join existing rides.
Scenario: Successfully join existing rides
    Given that available rides exist 
    When I tap on the desired ride card
    Then the "join the ride" button appears
    When I tap the "join the ride" button 
    Then a notification should be sent to the rider
    And the notification should give the option to "accept" or to "decline" the user as a passenger