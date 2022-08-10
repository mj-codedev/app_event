import 'app_event.interface.dart';

class AppEvent {
  static Map<String, List<AppEventInterface>> map = {};

  static register(String eventName, AppEventInterface iEvent) {
    List<AppEventInterface> events = [];

    if (map[eventName] == null) {
      events = <AppEventInterface>[];
    } else {
      events = map[eventName]!;
    }

    if (events.contains(iEvent)) {
      return;
    }

    events.add(iEvent);
    map[eventName] = events;
  }

  static unRegister(AppEventInterface listener) {
    map.removeWhere((key, events) {
      events.removeWhere((event) => event == listener);
      return events.isEmpty;
    });
  }

  static clear() {
    map.clear();
  }

  static dispatch(String eventName, {dynamic value}) {
    List<AppEventInterface>? events = map.containsKey(eventName) ? map[eventName] : [];

    events?.forEach((event) => event.onEventReceived(eventName, value));
  }
}
