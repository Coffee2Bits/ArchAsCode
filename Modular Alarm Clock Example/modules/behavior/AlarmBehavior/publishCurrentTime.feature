Feature: Publish Time

Scenario: Publish Current Time
    When waiting 1 second
    Then willPublish currentTime
