Feature: Notifications
    Registered users should be able access the "notifications" page and see the notifications available
Scenario: Successfully see the notification on the "notifications" page after someone sent me a message 
    Given that someone sent me a message
    Then I should receive a notification of that message

Scenario: Successfully see the notification on the "notifications" page after someone sent me a request to join my ride 
    Given that someone requested to join my ride
    Then I should receive a notification of that request