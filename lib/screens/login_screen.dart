import 'package:biapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orange[50],

      body:
      Center(
        child: Container(
          width: 500,
          height: 600,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "BI Analytics",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Smart Dashboard for Business Insights",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen(),
                        ),
                        );
                      },
                      child: const Text("Sign up"),
                    ),
                  ),

                  const SizedBox(width: 20),

                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
        ),
    );
  }
}