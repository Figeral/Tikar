import 'package:flutter/material.dart';
import 'package:tikar/view/desktop/pages/content/app_content.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    pwController.dispose();
  }

  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'noms d\'utilisateur',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'entrez votre noms d\'utilisateur';
                  } else if (value.length < 4) {
                    return 'entrez au moin 4 charactère';
                  } else if (value.contains("@") || value.contains("\$")) {
                    return "caractère speciaux interdit";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                obscureText: isPressed,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isPressed == true) {
                            isPressed = false;
                          } else {
                            isPressed = true;
                          }
                        });
                      },
                      child: Icon(
                          isPressed ? Icons.visibility : Icons.visibility_off)),
                  hintText: 'mots de passe',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                controller: pwController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'entrez un mot de passe ';
                  } else if (value.length < 4) {
                    return 'at least enter 4 characters';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Si vous n\'avez pas de compte allez sur SignIn et attendez Validation de votre compte par notre administration ansi que l\'attribution de vos accès',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurpleAccent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //  textStyle: MaterialStateProperty.all(TextStyle()),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // ... Navigate To your Home Page

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppContent()));
                }
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
