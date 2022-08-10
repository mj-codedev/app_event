# app_event
  App event help manage events easily. It is optimized to handle the event without being involved in the state. You can manage the event by simply adding it to the required class.


## Usage

### 1. Create Model

 - Implement AppEventInterface you want to use
```dart
class Model implements AppEventInterface{
  @override
  onEventReceived(String eventName, value) {
    if(eventName == "test1"){
      AAA();
    }
  }
}
```

### 2. Register Event 

 - Register your event name with your class implemented AppEventInterface
```dart
AppEvent.register("eventName", Model);
```

### 3. Dispatch Event 

 - Dispatch your event When you want
```dart
AppEvent.dispatch("test1");
```

### 4. Receive Event

 - There's nothing else you need to do.
All pre-made onEventReceived functions are executed automatically.

```dart
@override
onEventReceived(String eventName, value) {
  if(eventName == "test1"){
    AAA();
  }
}
```

### 5. Unregister Event

 - When you no longer use the event, unregister event
```dart
AppEvent.unRegister("test1");
```
