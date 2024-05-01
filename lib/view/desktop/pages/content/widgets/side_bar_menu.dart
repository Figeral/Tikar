import 'package:flutter/material.dart';
import 'package:tikar/model/icon_model.dart';
import 'package:tikar/constants/app_colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;
  MenuData data = MenuData();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      color: Theme.of(context).scaffoldBackgroundColor,
      // color: Colors.black,
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(MenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? AppColors.pButton : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuData {
  List<IconModel> menu = const <IconModel>[
    IconModel(icon: Icons.dashboard, title: "Panel"),
    IconModel(icon: Icons.home, title: "Immobiliers"),
    IconModel(icon: Icons.key, title: "Locations"),
    IconModel(icon: Icons.people_alt, title: "Locataires"),
    IconModel(icon: Icons.person, title: "Proprietaire"),
  ];
}
