import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            inputMaker("noms"),
            inputMaker("mots de pass"),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(),
              child: const Text("Validé"),
            )
          ],
        ),
      ),
    );
  }

  Padding inputMaker(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextFormField(
        decoration: InputDecoration(labelText: text),
      ),
    );
  }
}
