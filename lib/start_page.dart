import 'package:bloc_demo/mobi/form_validation_page.dart';
import 'package:bloc_demo/mobi/login_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Authenticate'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FormValidationPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
