import 'package:flutter/material.dart';
import 'package:tikar/view/desktop/pages/landing/landing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: const Landing(),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ],
          ),
          GestureDetector(),
          Container(),
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
