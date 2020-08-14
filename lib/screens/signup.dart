import 'package:cortex_earth_3/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends GetWidget<AuthController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Name'),
                controller: nameController,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: emailController,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    controller.createUser(nameController.text,
                        emailController.text, passwordController.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
