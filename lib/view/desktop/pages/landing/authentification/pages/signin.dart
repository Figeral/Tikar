import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              inputMaker("noms"),
              inputMaker("Tel"),
              inputMaker("mots pass"),
              inputMaker("Confirmation"),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(),
                child: const Text("Validé"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Padding inputMaker(String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    child: TextFormField(
      validator: (value) {
        if (value == null) {
        } else {}
      },
      decoration: InputDecoration(
        labelText: text,
      ),
    ),
  );
}
