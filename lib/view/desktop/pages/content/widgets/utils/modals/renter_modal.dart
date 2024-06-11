import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tikar/constants/utile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikar/constants/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RenterModal extends StatefulWidget {
  final double width, height;
  const RenterModal({super.key, required this.width, required this.height});

  @override
  State<RenterModal> createState() => _RenterModalState();
}

class _RenterModalState extends State<RenterModal> {
  Gender _selectedGender = Gender.male;
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    final width = widget.width;
    return width > 400 && height > 500
        ? Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50),
                //bottomRight: Radius.circular(50),
              ),
              color: Colors.grey.shade100,
            ),
            width: widget.width,
            height: widget.height,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.37, 0, 0, 0),
                        child: const Text(
                          "Ajouter un Bailleur",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: FittedBox(
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 75,
                                      backgroundImage: _image != null
                                          ? FileImage(File(_image!.path),
                                              scale: 1)
                                          : const AssetImage(
                                                  "assets/images/user.png")
                                              as ImageProvider<Object>?,
                                    ),
                                    Positioned(
                                        top: 100,
                                        left: 105,
                                        child: IconButton(
                                          onPressed: getImage,
                                          icon: const Icon(
                                            Icons.add_a_photo,
                                            size: 30,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: ' noms du bailleur',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              //controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "entrez un noms";
                                } else if (value.length < 4) {
                                  return 'entrez au moin 4 charactère';
                                } else if (value.contains("@") ||
                                    value.contains("\$")) {
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
                                prefixIcon: Icon(Icons.person),
                                hintText: ' prenoms du bailleur',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              //controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'entrez un prenom';
                                } else if (value.length < 4) {
                                  return 'entrez au moin 4 charactère';
                                } else if (value.contains("@") ||
                                    value.contains("\$")) {
                                  return "caractère speciaux interdit";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                prefixIcon: CountryCodePicker(
                                  dialogSize: Size(500, 450),
                                  hideMainText: true,
                                  showFlagMain: true,
                                  showFlag: true,
                                  initialSelection: 'CM',
                                  showOnlyCountryWhenClosed: true,
                                ),
                                hintText: 'Contact ',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              //controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'entrez un numéro contact valide';
                                } else if (value.length < 4) {
                                  return 'entrez au moin 4 charactère';
                                } else if (value.contains("@") ||
                                    value.contains("\$")) {
                                  return "caractère speciaux interdit";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                width * 0.01, 20, width * 0.01, 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text('Select your gender:'),
                                ),
                                Expanded(
                                  child: RadioListTile<Gender>(
                                    title: Text('Male'),
                                    value: Gender.male,
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<Gender>(
                                    title: Text('Female'),
                                    value: Gender.female,
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<Gender>(
                                    title: Text('Other'),
                                    value: Gender.other,
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size(width * 0.92, 60)),
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.nightBue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // ...Send input data to sever
                              }
                            },
                            child: Text(
                              'add lessor',
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
                )
              ],
            ),
          )
        : Container(
            color: Colors.grey.shade100,
          );
  }
}
