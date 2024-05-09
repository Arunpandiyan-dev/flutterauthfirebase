import 'package:firebase_auth/firebase_auth.dart';

class AuthenicationHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future signUp(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    }catch(e){
      print(e);
    }
  }  


  Future signIn(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    }catch(e){
      print(e);
    }
  }


  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
  }  

  
}

