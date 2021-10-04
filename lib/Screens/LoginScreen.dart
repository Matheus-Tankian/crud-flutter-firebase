import 'package:appcrud/firebase/helper.dart';
import 'package:flutter/material.dart';

import 'ResisterScreen.dart';

class LoginScreen extends StatelessWidget {
  Service service = Service();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
                color: Colors.grey.withOpacity(0.10),
              ),
              child: Center(
                child: Text(
                  "Login Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:emailController,
                decoration: InputDecoration(
                  labelText: "Enter Your Email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Enter Your Password",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Reset Password ?',
                ),
              ),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80),
                backgroundColor: Colors.green.withOpacity(0.5),
              ),
              onPressed: () {
                if(emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty){
                  service.loginUser(
                      emailController.text,
                      passwordController.text,
                      context);
                }else{
                  service.error(context, 'Field must not be empty');
                }

              },
              child: Text("Login"),
            ),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=>ResisterScreen()));
            },
                child: Text("Don't have any account?")),
          ],
        ),
      ),
    );
  }
}