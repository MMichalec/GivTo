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
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email ='';
  String password ='';
  String error = '';


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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => (val.isEmpty || !val.contains('@')) ? 'Enter an valid email' : null,
                onChanged: (val) {
                  setState (() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() => error = 'Could not sign in with those credentials');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text (
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ]
          ),
        ),
      ),
    );
  }
}
