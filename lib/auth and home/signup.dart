//import 'dart:math';

//import 'package:ap_firebase_auth/firebasehelper/dbhelper.dart';
import 'package:ap_firebase_auth/auth%20and%20home/loginscreen.dart';
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
    backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
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
                      decoration:const InputDecoration(
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintText: "Email",
                          labelText: "Enter Email",
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(18.0),
                        ),
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      obscureText: _isVisible2,
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
                          border: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintText: "Email",
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(18.0),
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _isVisible2 = !_isVisible2;
                                });
                              },
                              child: Icon(
                                  _isVisible2 ? Icons.visibility : Icons.visibility_off)),
                        ),
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
                          border: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8)),
                      
                          ),
                          hintText: "Conform Password",
                          labelText: "ConformPassword",
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(18.0),
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              child: Icon(
                                  _isVisible ? Icons.visibility : Icons.visibility_off)),
                        ),
                      
                    ),
                    const SizedBox(height: 25,),
                    GestureDetector(
                        onTap: (){
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        if(FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).toString() != "null"){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SignUp Successfully")));
                         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SignUp Failed")));
                        }
                        print(emailController.text);
                        print(passwordController.text);
                      }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color:Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          child: const Text('Signup',style: TextStyle(color:Color(0xFFFFFFFF),fontSize: 18,fontWeight: FontWeight.w500),),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                            },
                            child: const Text("login", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
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
                  }

*/