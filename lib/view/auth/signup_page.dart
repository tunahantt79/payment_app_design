import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:payment_app/main.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: SafeArea(
                        child: SizedBox(
                            height: 80,
                            child: Image.asset('assets/images/cignifi.png')),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Login to your Account',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 20)
                          ]),
                          child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  label: const Text('Email'),
                                  labelStyle:
                                      const TextStyle(color: Colors.black54),
                                  fillColor: Colors.white,
                                  filled: true),
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Email giriniz'
                                  : null),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 20)
                          ]),
                          child: TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  label: const Text('Password'),
                                  labelStyle:
                                      const TextStyle(color: Colors.black54),
                                  fillColor: Colors.white,
                                  filled: true),
                              validator: (value) {
                                if (value != null && value.length < 6) {
                                  return 'En az 6 karakter giriniz';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.black45, blurRadius: 20)
                      ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: signUp,
                        child: const Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                        child: Text(
                      '- Or sign in with -',
                      style: TextStyle(color: Colors.black54),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 20)
                            ]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(80, 50),
                                  backgroundColor: Colors.white),
                              child: Logo(
                                Logos.google,
                                size: 30,
                              ),
                              onPressed: () {},
                            ))),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      //  await _firestore.collection('users').doc(email.user).set('name') ;
    } on FirebaseAuthException catch (e) {
      print(e);

      //  Utils.showSnackBar(e.message);
    }
    //Navigator.of(context) not working !
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
