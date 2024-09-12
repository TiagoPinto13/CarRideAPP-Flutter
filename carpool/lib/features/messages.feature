Feature: Messages
    Registered users should be able to communicate with other users
Scenario: Successfully send messages
    Given that I have the user that I want to communicate with added to my messages 
    When I tap the icon of the user that I want to communicate with
    And I write a message
    And I tap the "Send" button
    Then the message should be sent to that user 
    And the other user should receive the message 
    And the other user should receive a notification that a message has been received