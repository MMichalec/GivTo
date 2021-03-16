import 'package:flutter/material.dart';
import 'package:givto/LogicLayer/authentication.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text ('Sing in to GivTo'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
        child: ElevatedButton(
          child: Text('Sing In Anon'),
          onPressed: () async {
            dynamic result = await _auth.singInAnon();

            if(result == null){
              print ('error singing in');
            } else {
              print ('signed in');
              print (result.uid);
            }
          },
        ),
      ),
    );
  }
}
