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
    

Feature: Join existing rides
    Registered users should be able to join existing rides.
Scenario: Successfully join existing rides
    Given that available rides exist 
    When I tap on the desired ride card
    Then the "join the ride" button appears
    When I tap the "join the ride" button 
    Then a notification should be sent to the rider
    And the notification should give the option to "accept" or to "decline" the user as a passenger

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

Feature: Notifications
    Registered users should be able access the "notifications" page and see the notifications available
Scenario: Successfully see the notification on the "notifications" page after someone sent me a message 
    Given that someone sent me a message
    Then I should receive a notification of that message

Scenario: Successfully see the notification on the "notifications" page after someone sent me a request to join my ride 
    Given that someone requested to join my ride
    Then I should receive a notification of that request

    
Feature: Sustainability Metrics
    Registered users should be able to access their sustainability metrics
Scenario: Successfully tap the "Metrics" button
    Given that I already took part in at least one ride
    Then I should be able to view metrics tracking my environmental impact

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
    
Feature: Cost Sharing
    Registered users should be informed about ride cost divisions
Scenario: Successfully see the cost of a ride
    Given I am in the "choose a ride" page
    Then I should be able to see the cost division for the presented rides

Feature: Language options
   Registered users should be able to choose the language that most suits them 
Scenario: Successfully choose the language
    Given that I'm in the "change language" page
    When I select the desired language
    Then the app should change its language to the chosen one

Feature: View options
    The Registered user should be able to choose the view option that most suits him  
Scenario: Successfully choose the view option
    Given I am in the "settings" page
    When I tap the toggle "light/dark mode" button
    Then the app should change its appearance to the chosen tone

Feature: Disability Compatibility
    Registered Users should be able to see the rides that accept disabled users
Scenario: Successfully see rides that accept disabled users
    Given I am in the "choose a ride" page
    Then I should be able to see which trips meet the requirements to travel with a disabled user
