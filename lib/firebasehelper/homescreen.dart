import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../loginscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home'),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
            }, child: const Text('Logout')),
          ],
        ),
      
      ),
    );
  } 
}