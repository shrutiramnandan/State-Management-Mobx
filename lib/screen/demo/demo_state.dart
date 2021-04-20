import 'package:equatable/equatable.dart';

abstract class DemoState extends Equatable {
	DemoState([List props = const []]) : super();
}

class DemoUninitializedState extends DemoState {
	@override
	String toString() => 'DemoUninitializedState';

  @override
  List<Object> get props => throw UnimplementedError();
}

class DemoInitializedState extends DemoState {
	@override
	String toString() => 'DemoInitializedState';

  @override
  List<Object> get props => throw UnimplementedError();
}


class DemoToNextScreenNavigatingState extends DemoState {
	@override
	String toString() => 'DemoToNextScreenNavigatingState';

  @override
  List<Object> get props => throw UnimplementedError();
}

class DemoToNextScreenNavigatedState extends DemoState {
	@override
	String toString() => 'DemoToNextScreenNavigatedState';

  @override
  List<Object> get props => throw UnimplementedError();
}
