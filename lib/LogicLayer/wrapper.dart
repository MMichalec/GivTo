import 'package:flutter/material.dart';
import 'package:givto/ViewLayer/HomeView/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Authenticate widget
    return Home();
  }
}
