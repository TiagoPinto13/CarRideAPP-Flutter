Feature: View options
    The Registered user should be able to choose the view option that most suits him  
Scenario: Successfully choose the view option
    Given I am in the "settings" page
    When I tap the toggle "light/dark mode" button
    Then the app should change its appearance to the chosen tone