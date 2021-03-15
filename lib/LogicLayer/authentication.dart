import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sing in anon
  Future singInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  //sing in with email and password

  //register with email and password

  //sing out

}