//import 'dart:math';

//import 'package:ap_firebase_auth/firebasehelper/dbhelper.dart';
import 'package:ap_firebase_auth/firebasehelper/homescreen.dart';
import 'package:ap_firebase_auth/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisible = true;
  bool _isVisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Form(
               key: formkey,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                   Center(
                    child: Image.asset('assets/pngwing.png', width: 200, height: 200),
                  ),  
                const SizedBox(height: 30,),
                 const Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                    decoration: const InputDecoration(
                      hintText: "Enter Email"
                    )
                  ),
                  const SizedBox(height: 25,),
                  TextFormField(
                    obscureText: _isVisible,
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
                    decoration:InputDecoration(
                      
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          child: Icon(
                              _isVisible ? Icons.visibility : Icons.visibility_off)),
                      hintText: "Password"
                    )
                  ),
                   const SizedBox(height: 25,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Confirm Password";
                      }else if(passwordController.text != value){
                        return "Password Not Matched";
                      }else {
                        return null;
                      }
                    },
                    onSaved: (value){
                      passwordController.text = value!;
                    },
                    obscureText: _isVisible2,
                    decoration:InputDecoration(
                      
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isVisible2 = !_isVisible2;
                            });
                          },
                          child: Icon(
                              _isVisible2 ? Icons.visibility : Icons.visibility_off)),
                      hintText: "Confirm Password"
                    )
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      if(FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).toString() != "null"){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SignUp Successfully")));
                       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SignUp Failed")));
                      }
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  }, child:const Text("SignUp")),
                   const SizedBox(height: 25,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an Account?  ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                        child: const Text("Login",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      )
                    ],
                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}