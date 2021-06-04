import 'package:event_bus/event_bus.dart';

final EventBus eventBus = EventBus();

class ApplicationExitEvent{

  Map<String, dynamic> data;//ws消息
  ApplicationExitEvent(Map<String, dynamic> data){
    this.data = data;
  }
}
