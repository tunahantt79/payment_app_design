import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payment_app/main.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0)),
                                label: const Text('Email'),
                                labelStyle:
                                    const TextStyle(color: Colors.black54),
                                fillColor: Colors.white,
                                filled: true),
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
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
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            controller: passwordController,
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
                      onPressed: signIn,
                      child: const Text('Sign In'),
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
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.grey),
                            text: "Don't have an account ? ",
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignUp,
                              text: 'Sign up',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary))
                        ])),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
