import 'package:flutter/material.dart';
import 'package:givto/ViewLayer/Authenticate/register.dart';
import 'package:givto/ViewLayer/Authenticate/sing_in.dart';

    class Authenticate extends StatefulWidget {
      @override
      _AuthenticateState createState() => _AuthenticateState();
    }

    class _AuthenticateState extends State<Authenticate> {

      bool showSignIn = true;
      void toggleView() {
        setState(() => showSignIn = !showSignIn);
      }

      @override
      Widget build(BuildContext context) {
        if(showSignIn){
          return SingIn(toggleView: toggleView);
        }else {
          return Register(toggleView: toggleView);
        }
      }
    }
