import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/auth/sign_in.dart';
import 'package:posthub/components/beta.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      await FirebaseFirestore.instance.collection("users").add({
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text
      });
// ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Sign Up successful✅")));
    } catch (e) {
       // ignore: use_build_context_synchronously
       ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: const Duration(seconds: 2),
          content: Text("The error is ${e.toString()}")));
    }
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      // controller: fullnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'username',
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'email',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          suffixIcon: const Icon(Icons.check_circle_rounded)),
                    ),
                  ),
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          suffixIcon: const Icon(Icons.visibility)),
                    ),
                  ),
                ),
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
                          child: Text("Register now",
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
