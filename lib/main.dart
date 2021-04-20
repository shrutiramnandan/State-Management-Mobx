
import 'package:bloc_demo/mobi/colory_page.dart';
import 'package:bloc_demo/mobi/counter_page.dart';
import 'package:bloc_demo/mobi/form_validation_page.dart';
import 'package:bloc_demo/mobi/main_page.dart';
import 'package:bloc_demo/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/demo/demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return   MaterialApp(
            debugShowCheckedModeBanner: false,
            
            home:
            StartPage()
            // MainPage()
            // FormValidationPage()
            // ColoryPage()
            //  CounterPage()
          );
    // BlocProvider(
    //   create: (_) => DemoBloc().,
    //   child: BlocBuilder<DemoEvent, DemoState>(
    //     builder: (_, theme) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         theme: theme,
    //         home:DemoPage(
    //           demoBloc: ,
    //           ),
    //       );
    //     },
    //   ),
    // );
  }
}

