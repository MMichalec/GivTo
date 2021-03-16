import 'package:flutter/material.dart';
import 'package:givto/LogicLayer/authentication.dart';

class SingIn extends StatefulWidget {

  final Function toggleView;
  SingIn({this.toggleView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  final AuthService _auth = AuthService();

  //text field state
  String email ='';
  String password ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text ('Sing in to GivTo'),
        actions: <Widget> [
          FlatButton.icon(onPressed: () {
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState (() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState (() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  print(email +' ' + password);
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}
