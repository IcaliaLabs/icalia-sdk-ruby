# Icalia SDK Change Log

## 0.1.6

### Event Core

  - Fixed 'created_at' fields being deserialized as 'updated_at'
  - Added missing serializer for oauth application
  - Added missing serializer for oauth access token

### Event Notification (AWS SNS+SQS)

  - Fixed event worker not ignoring unimplemented processor methods
