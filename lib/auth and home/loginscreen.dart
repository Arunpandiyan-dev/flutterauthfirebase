// ignore_for_file: use_build_context_synchronously
import 'package:ap_firebase_auth/auth%20and%20home/forgotpass.dart';
import 'package:ap_firebase_auth/auth%20and%20home/homescreen.dart';
import 'package:ap_firebase_auth/auth%20and%20home/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
            child: Image.asset('assets/pngwing.png', width: 200, height: 200),
          ),
                    const SizedBox(height: 30),
                    const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-z]").hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        hintText: "Enter Email",
                        labelText: "Email",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(18.0),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      obscureText: _isVisible,
                      decoration: InputDecoration(

                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        labelText: "Password",
                        
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
                        hintText: "Enter Password"),
                    ),
                    const SizedBox(height: 25),  
                    
                    GestureDetector(
                      onTap: _login,
                      child: Container(
                        decoration: const BoxDecoration(
                          color:Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        height: 50,
                        width: double.infinity,
                        child: const Text('Login',style: TextStyle(color:Color(0xFFFFFFFF),fontSize: 18,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    const SizedBox(height: 25),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                        },
                          child: const Text('forgot password?',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue),)),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                          },
                          child: const Text("Create Account", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful")));
      } on FirebaseAuthException catch (e) {
        String message;
        switch (e.code) {
          case 'user-not-found':
            message = 'No user found for that email.';
            break;
          case 'wrong-password':
            message = 'Wrong password provided for that user.';
            break;
          default:
            message = 'Login failed. Please try again.';
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }
}

