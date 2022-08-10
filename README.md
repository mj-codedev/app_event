# app_event
  App event help manage events easily without using stream. You can manage the event by simply adding it to the required class.
  
#### App_event Structure
![sdcdc drawio](https://user-images.githubusercontent.com/76766596/183838752-ac8394e4-8185-4a3b-a113-d704577a3665.png)


## Usage

### 1. Create Receiver

 - Implement AppEventInterface you want to use
```dart
class Receiver implements AppEventInterface{
  @override
  onEventReceived(String eventName, value) {
    if(eventName == "testEvent"){
      //todo: update by event
    }
  }
}
```

### 2. Register Event 

 - Register your event name with your class implemented AppEventInterface
```dart
AppEvent.register("testEvent", Model);
```

### 3. Dispatch Event 

 - Dispatch your event When you want
```dart
AppEvent.dispatch("testEvent");
```

### 4. Receive Event

 - There's nothing else you need to do.
All pre-made onEventReceived functions are executed automatically.

```dart
@override
onEventReceived(String eventName, value) {
  if(eventName == "testEvent"){
      //todo: update by event
  }
}
```

### 5. Unregister Event

 - When you no longer use the event, unregister event
```dart
AppEvent.unRegister("testEvent");
```
