import 'package:bloc/bloc.dart';
import 'package:bloc_demo/screen/demo/demo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
  class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc(DemoState initialState) : super(initialState);


    
    @override
    Stream<DemoState> mapEventToState(

      DemoEvent event,
    ) async* {
      if (event is DemoStartedEvent) {
        yield DemoInitializedState();
  
        yield DemoToNextScreenNavigatingState();
      }
      if (event is DemoToNextScreenNavigationCompletedEvent) {
        yield DemoToNextScreenNavigatedState();
      }
    }
  }
  