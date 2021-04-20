import 'package:equatable/equatable.dart';

abstract class DemoEvent extends Equatable {}
class DemoStartedEvent extends DemoEvent {
  @override
  String toString() => 'DemoStartedEvent';

  @override
  
  List<Object> get props => throw UnimplementedError();
}


class DemoToNextScreenNavigationCompletedEvent
    extends DemoEvent {
  @override
  String toString() => 'DemoToNextScreenNavigationCompletedEvent';

  @override
 
  List<Object> get props => throw UnimplementedError();
}
