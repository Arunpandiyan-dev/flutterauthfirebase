import 'package:ap_firebase_auth/dbhelper/dbhelper.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
  
  void forgotPassword(String text) {}
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/pngwing.png', width: 200, height: 200),
             const Text('Enter your email and we will send you a link to reset your password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
             SizedBox(height: 20,),
             TextField(
               controller: _emailController,
               keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(_emailController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Email")));
                    return;
                  }
                  AuthenicationHelper().forgotPassword(_emailController.text);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Reset Link Sent")));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  child: const Text('Reset Password',style: TextStyle(color:Color(0xFFFFFFFF),fontSize: 18,fontWeight: FontWeight.w500),),
                ),
              ),
              SizedBox(height: 15,),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Back to Login',style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.w400),))
            ]
          ),
        )
      ),
    );
  }
  
  
}