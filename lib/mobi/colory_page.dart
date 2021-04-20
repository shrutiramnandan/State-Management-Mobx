import 'package:bloc_demo/mobi/store/counter/colory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ColoryPage extends StatelessWidget {
  final Colory counter = Colory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Observer(
                            builder:(_) =>Container(
                color: counter.c,
                height: 200,
                width: 200,
            ),
          ),
            SizedBox(height:10),

            TextButton(
              onPressed: counter.changeColor, 
             child:Text("change Color"),
             )
          ],
        )
      ),
      
    );
  }
}