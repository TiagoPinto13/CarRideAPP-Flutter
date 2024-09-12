Feature: Language options
   Registered users should be able to choose the language that most suits them 
Scenario: Successfully choose the language
    Given that I'm in the "change language" page
    When I select the desired language
    Then the app should change its language to the chosen one