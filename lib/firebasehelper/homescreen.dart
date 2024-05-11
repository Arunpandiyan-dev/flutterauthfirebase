import 'package:ap_firebase_auth/firebasehelper/calculator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../loginscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                const ScaffoldMessenger(child: SnackBar(content: Text("Logout Successfully")));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Home'),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50,right:50,top: 25,bottom: 25),
            child: Column(
              children: [
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Calculator()));
                    },
                    child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            child: const Text('Calculator',style: TextStyle(color:Color(0xFFFFFFFF),fontSize: 18,fontWeight: FontWeight.w500),),
                          ),
                  ),
                  ],
            ),
          ),
        ],
      ),
    );
  } 
}