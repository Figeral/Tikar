import 'package:flutter/material.dart';
import 'package:tikar/vm/sidebar_vm.dart';
import 'package:tikar/view/desktop/pages/content/widgets/assets.dart';
import 'package:tikar/view/desktop/pages/content/widgets/lessor.dart';
import 'package:tikar/view/desktop/pages/content/widgets/renter.dart';
import 'package:tikar/view/desktop/pages/content/widgets/Employee.dart';
import 'package:tikar/view/desktop/pages/content/widgets/location.dart';
import 'package:tikar/view/desktop/pages/content/widgets/dashboard.dart';
import 'package:tikar/view/desktop/pages/content/widgets/side_bar_menu.dart';

class AppContent extends StatefulWidget {
  const AppContent({super.key});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  final vm = SideBarViewModel();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vm.dispose();
  }

  // final vm = Provider.value(value: value);
  final appContent = const <Widget>[
    Dashboard(),
    Assets(),
    Location(),
    Renter(),
    Lessor(),
    Employee(),
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
                Expanded(
                    flex: 6,
                    child: SideBar(
                      callback: (currentIndex) => vm.changedIndex(currentIndex),
                    )),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Divider(
            thickness: 3,
            color: Colors.black12,
          ),
          Expanded(
            flex: 10,
            child: StreamBuilder<int>(
              initialData: 0,
              stream: vm.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return appContent[snapshot.data!.abs()];
                } else {
                  return const Text("Stream failed");
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
