import 'package:bloc_demo/mobi/store/form/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class FormValidationPage extends StatefulWidget {
  @override
  _FormValidationPageState createState() => _FormValidationPageState();
}

class _FormValidationPageState extends State<FormValidationPage> {
  final FormStore store = FormStore();

   @override
  void initState() {
    super.initState();
    store.setupValidations();
     store.nonce();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       title: Text("Form validation with mobx"), 
       centerTitle: true,
      ),
      body: Form(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child:
          //  Stack(
          //   children:[
            SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) =>  new TextFormField(
                    onChanged: (value) => store.name = value,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      labelText: 'Username',
                        hintText: 'Username',
                        errorText: store.error.username,
                       
                      fillColor: Colors.white70),
                ),
                  
                ),
                // Observer(
                //     builder: (_) => AnimatedOpacity(
                //         child: const LinearProgressIndicator(),
                //         duration: const Duration(milliseconds: 300),
                //         opacity: store.isUserCheckPending ? 1 : 0)),
                SizedBox(height:10),

                Observer(
                  builder: (_) =>  new TextFormField(
                    onChanged: (value) => store.displayName = value,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      labelText: 'Display Name',
                        hintText: 'Display Name',
                        errorText: store.error.displayname,
                       
                      fillColor: Colors.white70),
                )),
                SizedBox(height:10),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: (value) => store.email = value,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                           const Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70,
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                        errorText: store.error.email),
                  ),
                ),
                SizedBox(height:10),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: (value) => store.password = value,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                           const Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70,
                        labelText: 'Password',
                        hintText: 'Set a password',
                        errorText: store.error.password),
                  ),
                ),
                SizedBox(height:20),
                ElevatedButton(
                      child: const Text('Register'),
                      onPressed: store.validateAll,
                    )
                // Observer(
                //   builder:(_) {
                //    final  future = store.registerVal;
                //     return future.status == FutureStatus.pending?
                //     ElevatedButton(
                //       child: const Text('Register'),
                //       onPressed: store.validateAll,
                //     ):
                //     ElevatedButton(
                //       child:CircularProgressIndicator(),
                //       onPressed: null,
                //     );
                    
                    
                //   }
                                    
                // )
              ],
            ),
          ),
          


          //  ]
          // )
         
         
        )),
    );
  }
}
