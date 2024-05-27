import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';
import 'package:tikar/view/desktop/pages/landing/landing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tikar/view/desktop/pages/landing/authentification/authenticate.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final wm = WindowManager;
  final _pageController = PageController();
  bool leftTap = false;
  bool rightTap = true;
  @override
  Widget build(BuildContext context) {
    int _pageIndex = 0;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              Landing(),
              Authenticate(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.80),
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: leftTap,
                      child: Container(
                        alignment: const Alignment(-1, -0.0),
                        child: IconButton(
                            iconSize: 200,
                            onPressed: () {
                              setState(() {
                                _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                                leftTap = false;
                                rightTap = true;
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_double_arrow_left_outlined,
                              color: Colors.black38,
                            )),
                      ),
                    ),
                    SizedBox(width: sWidth * 0.75),
                    Visibility(
                      visible: rightTap,
                      child: Container(
                        alignment: const Alignment(1, -0.0),
                        child: IconButton(
                          iconSize: 200,
                          onPressed: () {
                            setState(() {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);

                              rightTap = false;
                              leftTap = true;
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_double_arrow_right,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
