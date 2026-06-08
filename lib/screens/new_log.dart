import 'package:biapp/screens/homepage.dart';
import 'package:biapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser(String email, String password) async {

    final response = await http.post(
     Uri.parse("http://192.168.1.5:5000/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password
      }),
    );

    print(response.body);   // IMPORTANT

    var data = jsonDecode(response.body);

    if(data["message"] == "Login successful"){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"]))
      );
    }
  }
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                            prefixIcon: Icon(Icons.password),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Forget Password..",
                          style: TextStyle(color: Colors.blue),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen(),
                                  ),
                                  );
                                },
                                child: const Text("Sign up",
                                    style: TextStyle(color: Colors.black)
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            SizedBox(
                              width: 130,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {

                                  if(emailController.text.isEmpty || passwordController.text.isEmpty){

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Please enter email and password"))
                                    );

                                    return;
                                  }

                                  loginUser(
                                    emailController.text,
                                    passwordController.text,
                                  );

                                },
                                child: const Text("Login"),
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