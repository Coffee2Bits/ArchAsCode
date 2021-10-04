Feature: Alarm deactivateAlarm
  The alarm should be deactivated when the alarm component receives an
  alarm acknowledgement message.
   
   
  Scenario: Deactivate an acknowledged an alarm.
    Given the alarm has published an AlarmStatus message
      And the alarmId field is 1
      And the active field is true
    When the alarm receives an AlarmAcknowledgement message
      And the alarmId field is 1
      And the alarmAcknowledged field is true
    Then the alarm will publish an AlarmStatus message
      And the alarmId field will be 1
      And the active field will be false
   
   
  Scenario: Do not deactivate an alarm if the acknowledgement is false.
    Given the alarm has published an AlarmStatus message
      And the alarmId field is 2
      And the active field is true
    When the alarm receives an AlarmAcknowledgement message
      And the alarmId field is 2
      And the alarmAcknowledged field is false
    Then the alarm will publish an AlarmStatus message
      And the alarmId field will be 2
      And the active field will be true
   
   
  Scenario: Deactivate an alarm if an acknowledgement is received for an unknown
    alarm.
    When the alarm receives an AlarmAcknowledgement message
      And the alarmId field is 3
      And the alarmAcknowledged field is true
    Then the alarm will publish an AlarmStatus message
      And the alarmId field will be 3
      And the active field will be false
       
       
  Scenario: Do not reactivate a previously acknowledged alarm.
    Given the alarm has published an AlarmStatus message
      And the alarmId field is 4
      And the active field is true
      And the alarm has received an AlarmAcknowledgement message
      And the alarmId field is 4
      And the alarmAcknowledged field is true
      And the alarm has published an AlarmStatus message
    When the alarm receives an AlarmAcknowledgement message
      And the alarmId field is 4
      And the alarmAcknowledged field is false 
    Then the alarm will publish an AlarmStatus message
      And the alarmId field will be 4
      And the active field will be false
