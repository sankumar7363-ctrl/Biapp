import 'package:biapp/screens/new_log.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future signupUser(String name, String email, String password) async {

  final response = await http.post(
    Uri.parse("http://192.168.1.5:5000/signup"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "name": name,
      "email": email,
      "password": password
    }),
  );

  print(response.body);
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              "Assets/Picture1.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Right side login container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                width: 390,
                height: double.infinity,

                color: Colors.white.withOpacity(0.55),

                child: Center(
                  child: Container(
                    width: 330,

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
                          style: TextStyle(color: Colors.black),
                        ),

                        const SizedBox(height: 40),

                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 130,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  signupUser(nameController.text, emailController.text, passwordController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("User Registered Successfully"))
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Login()),
                                  );
                                },
                                child: const Text("Sign Up"),
                              )
                            ),

                            const SizedBox(width: 20),

                            SizedBox(
                              width: 130,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),
                                  ),
                                  );
                                },
                                child: const Text("Login",
                                    style: TextStyle(color: Colors.black)
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}