import 'package:flutter/material.dart';
import 'package:givto/ViewLayer/Authenticate/authenticate.dart';
import 'package:givto/ViewLayer/HomeView/home.dart';
import 'package:provider/provider.dart';
import 'package:givto/ModelLayer/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either Home or Authenticate widget

    if (user == null) return Authenticate();
        else return Home();

  }
}
