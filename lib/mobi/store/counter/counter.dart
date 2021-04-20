// import 'package:mobx/mobx.dart';


//  abstract class CounterBase with Store{



//   @action
//   void increment(){
//     count++;
//   }

//   @action
//   void decrement(){
//     count--;
//   }
// }

import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}