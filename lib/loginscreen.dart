//import 'package:ap_firebase_auth/firebasehelper/dbhelper.dart';
import 'package:ap_firebase_auth/firebasehelper/homescreen.dart';
import 'package:ap_firebase_auth/firebasehelper/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 25,),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Email";
                  }else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    return "Please Enter Valid Email";
                  }else {
                    return null;
                  }
                },
                onSaved: (value){
                  emailController.text = value!;
                }, 
                
                decoration:const InputDecoration(
                  hintText: "Enter Email"
                )
              ),
              const SizedBox(height: 25,),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  }else {
                    return null;
                  }
                },
                onSaved: (value){
                  passwordController.text = value!;
                },
                decoration: const InputDecoration(
                  hintText: "Confirm Password"
                )
              ),
              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                  formkey.currentState!.save();
                  if(FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).toString() != "null"){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful")));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed")));

                  }
                }
              }, child:const Text("Login")),
               const SizedBox(height: 25,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?  ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Create Account",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                  )
                ],
               )
            ],
          ),
        ),
      ),
    );
  }
}