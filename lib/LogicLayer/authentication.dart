import 'package:firebase_auth/firebase_auth.dart' as FirebaseLib;
import 'package:givto/ModelLayer/user.dart';

class AuthService {

  final FirebaseLib.FirebaseAuth _auth = FirebaseLib.FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebase (FirebaseLib.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges()
    //.map((FirebaseLib.User user) => _userFromFirebase(user));
      .map(_userFromFirebase);
  }

  //sing in anon
  Future singInAnon() async {
    try{
      FirebaseLib.UserCredential result = await _auth.signInAnonymously();
      FirebaseLib.User user = result.user;
      return _userFromFirebase(user);
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  //sing in with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      FirebaseLib.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseLib.User user = result.user;
      return _userFromFirebase(user);
    }catch(e){
      //TODO: Catch an error!
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  //sing out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print (e.toString());
      return null;
    }
  }

}