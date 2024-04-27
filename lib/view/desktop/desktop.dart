import 'package:flutter/material.dart';
import 'pages/landing/authentification/login.dart';
import 'package:window_manager/window_manager.dart';
import 'package:tikar/view/desktop/pages/landing/landing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final wm = WindowManager;

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              Landing(),
              Login(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _pageController, count: 2,
              onDotClicked: (int toPageIndex) {
                if (toPageIndex.toInt() == 1) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              // axisDirection:,
            ),
          ),
        ],
      ),
    );
  }
}
