

import 'package:bloc_demo/mobi/store/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterPage extends StatelessWidget {
 final Counter counter = Counter();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter",style: TextStyle(fontSize:30)),
             Observer(
               builder: (BuildContext context)=> Text("${counter.value}",)),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
               TextButton.icon(
                 onPressed: counter.increment, 
                 icon: Icon(Icons.add), 
                 label: Text("add",)),
                 TextButton.icon(
                 onPressed: counter.decrement, 
                 icon: Icon(Icons.remove), 
                 label: Text("minus")
             ),
             ],
             
             
             ),

             

          ],
        ),
      ),
      
    );
  }
}

