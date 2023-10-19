// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/auth/sign_in.dart';
import 'package:posthub/components/beta.dart';
import 'package:posthub/components/epslon.dart';
// import 'package:posthub/models/user_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final String? currentUserEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  bool isSigningUp = false;

  void signUp() async {
    setState(() {
      isSigningUp = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserEmail)
          .set(
        {
          "email": emailController.text.trim(),
          "username": usernameController.text.trim(),
          "password": passwordController.text.trim(),
          "profileImage":
              "https://images.unsplash.com/photo-1540331547168-8b63109225b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1619&q=80"
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Sign Up successful✅")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 2),
          content: Text("The error is ${e.toString()}")));
    }
    setState(() {
      isSigningUp = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Let's get Started!",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Please enter your information below to create an account for using in the app",
                    style: GoogleFonts.lato(
                        color: Colors.grey.shade500, fontSize: 20),
                  ),
                ),

                //username textfield
                MyTextFields(
                    hintText: "Username", controller: usernameController),
                MyTextFields(hintText: "Email", controller: emailController),
                MyTextFields(
                    hintText: "Password", controller: passwordController),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: isSigningUp
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.orange,
                                  ),
                                )
                              : Text("Register now",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.lato(),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginPage())));
                        },
                        child: Text("Log in",
                            style: GoogleFonts.lato(
                                color: Colors.deepOrange, fontSize: 15)))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or sign up with",
                          style: GoogleFonts.lato(),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginOptions(imageUrl: "assets/g.png"),
                    SizedBox(
                      width: 20,
                    ),
                    LoginOptions(
                      imageUrl: "assets/appleios.png",
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
