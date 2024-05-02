import 'package:flutter/material.dart';
import 'package:tikar/constants/app_colors.dart';
import 'package:tikar/view/desktop/pages/content/widgets/assets.dart';
import 'package:tikar/view/desktop/pages/content/widgets/lessor.dart';
import 'package:tikar/view/desktop/pages/content/widgets/renter.dart';
import 'package:tikar/view/desktop/pages/content/widgets/location.dart';
import 'package:tikar/view/desktop/pages/content/widgets/dashbord.dart';
import 'package:tikar/view/desktop/pages/content/widgets/side_bar_menu.dart';

class AppContent extends StatefulWidget {
  const AppContent({super.key});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  final appContent = const <Widget>[
    Dashboard(),
    Assets(),
    Location(),
    Renter(),
    Lessor(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Image(
                          image: AssetImage("assets/images/tikar.png")),
                    )),
                const Expanded(flex: 6, child: SideBar()),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.lightGreenAccent,
            ),
          )
        ],
      )),
    );
  }
}
