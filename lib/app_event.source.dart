import 'app_event.interface.dart';

class AppEvent {
  static Map<String, List<IAppEvent>> map = {};

  static register(String eventName, IAppEvent iEvent) {
    List<IAppEvent> events = [];

    if (map[eventName] == null) {
      events = <IAppEvent>[];
    } else {
      events = map[eventName]!;
    }

    if (events.contains(iEvent)) {
      return;
    }

    events.add(iEvent);
    map[eventName] = events;
  }

  static unRegister(IAppEvent listener) {
    map.removeWhere((key, events) {
      events.removeWhere((event) => event == listener);
      return events.isEmpty;
    });
  }

  static clear() {
    map.clear();
  }

  static dispatch(String eventName, {dynamic value}) {
    List<IAppEvent>? events = map.containsKey(eventName) ? map[eventName] : [];

    events?.forEach((event) => event.onEventReceived(eventName, value));
  }
}
