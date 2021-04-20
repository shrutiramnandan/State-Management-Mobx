import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bloc_demo/screen/demo/demo.dart';

class DemoView extends StatefulWidget {
	@override
	_DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView>{
	static DemoBloc _demoBloc;

	@override
	void initState() {
		super.initState();
		// _demoBloc = DemoBloc();
	}

	@override
	void dispose() {
		_demoBloc.close();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return DemoPage(
			demoBloc: _demoBloc,
		);
	}
}
