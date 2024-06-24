import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikar/constants/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tikar/view/desktop/pages/content/app_content.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  bool isPressed = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController cpwController = TextEditingController();
  XFile? _image;
  final picker = ImagePicker();
  void getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    telController.dispose();
    pwController.dispose();
    cpwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Noms d\'utilisateur',
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
                  decoration: const InputDecoration(
                    prefixIcon: CountryCodePicker(
                      dialogSize: Size(500, 450),
                      hideMainText: true,
                      showFlagMain: true,
                      showFlag: true,
                      initialSelection: 'CM',
                      showOnlyCountryWhenClosed: true,
                    ),
                    hintText: 'Téléphone ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  controller: telController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' numéro de téléphone absent';
                    } else if (value.length < 9) {
                      return 'numéro trop court';
                    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'une ou deux lettre présente';
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
                    suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPressed = !isPressed;
                            // if (isPressed == true) {
                            //   isPressed = false;
                            // } else {
                            //   isPressed = true;
                            // }
                          });
                        },
                        child: Icon(isPressed
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    prefixIcon: const Icon(Icons.lock_open),
                    hintText: 'mots de passe',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  controller: pwController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'mots de passe absent ';
                    } else if (value.length < 4) {
                      return 'entrez au moin 4 charactère';
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
                    prefixIcon: const Icon(Icons.lock_open),
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
                        child: Icon(isPressed
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: 'Confirmation',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  controller: cpwController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirmation absent';
                    } else if (value.length < 4) {
                      return 'entrez au moin 4 charactère';
                    } else if (value != pwController.text) {
                      return "différent du mots de passe";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(120, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.nightBue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: getImage,
                      child: Text(
                        'Image',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    _image != null
                        ? Text(
                            "${_image!.path.length > 50 ? _image?.path.substring(1, 60) : _image?.path}")
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Créer un compte signifie que vous acceptez nos conditions d\'utilisation et notre politique de confidentialité. Tout doit réserver par Tikar',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 60)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                  'Signin',
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
      ),
    );
  }
}
