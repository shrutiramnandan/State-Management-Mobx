import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/screen/demo/demo.dart';

class DemoPage extends StatefulWidget {
  final DemoBloc demoBloc;

  DemoPage({
    @required this.demoBloc,
  });

  @override
  _DemoPageState createState() {
    return _DemoPageState();
  }
}

class _DemoPageState extends State<DemoPage> {
  DemoBloc get _demoBloc => widget.demoBloc;

  @override
  void initState() {
    super.initState();
    _demoBloc.add(
      DemoStartedEvent(),
    );
  }

  @override
  void dispose() {
    _demoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        cubit: _demoBloc,
        builder: (BuildContext context, DemoState state) {
          return Container(
            
          );
        },
      ),
    );
  }
}
