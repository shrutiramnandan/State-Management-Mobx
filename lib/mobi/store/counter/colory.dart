import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'colory.g.dart';

class Colory = _Colory with _$Colory;

abstract class _Colory with Store{

  @observable
  Color c = Colors.red;


  @action
  void changeColor(){
    c = Colors.green;
  }


}