import 'package:flutter/material.dart';
import 'package:tikar/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tikar/view/desktop/pages/landing/authentification/authenticate.dart';

// import 'package:window_manager/window_manager.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  int _currentpage = 0;
  final _pageController = PageController();
  bool leftTap = false;
  bool rightTap = true;
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) => setState(() => _currentpage = value),
            controller: _pageController,
            children: [
              //Landing(),
              // Authenticate(),
              landingPages("assets/images/admin.png",
                  "Votre solution immobilière tout-en-un.\nGérez vos biens locataires employées finances en toute simplicité."),
              landingPages("assets/images/finance.png",
                  '''Maîtrisez parfaitement vos finances immobilières.
Notre ERP vous offre une vision à 360° de votre activité pour un pilotage financier optimal.'''),
              landingPages(
                  "assets/images/task.png",
                  '''Planifiez et suivez tous vos rendez-vous clients en un coup d'œil.
Visualisez votre agenda immobilier, programmez et confirmez facilement vos rendez-vous.''',
                  button: button(context, sWidth))
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            child: SmoothPageIndicator(
              controller: _pageController, count: 3,
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
                      visible: _currentpage > 0 ? true : false,
                      child: Container(
                        alignment: const Alignment(-1, -0.0),
                        child: IconButton(
                            iconSize: 200,
                            onPressed: () {
                              setState(() {
                                _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                                // leftTap = false;
                                // rightTap = true;
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
                      visible: _currentpage < 2 ? true : false,
                      child: Container(
                        alignment: const Alignment(1, -0.0),
                        child: IconButton(
                          iconSize: 200,
                          onPressed: () {
                            setState(() {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);

                              // rightTap = false;
                              // leftTap = true;
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

ElevatedButton button(BuildContext context, double sWidth) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Authenticate()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.nightBue,
      minimumSize: Size(
        sWidth * 0.25,
        60.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    child: const Text(
      'Commencer',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}

Widget landingPages(String asset, String text,
    {ElevatedButton? button, double? width}) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          alignment: const Alignment(0, -1),
          child: const SizedBox(
            height: 290,
            width: 400,
            child: Image(
              image: AssetImage("assets/images/tikar.png"),
            ),
          ),
        ),
        Container(
          alignment: const Alignment(0, -0.0),
          child: SizedBox(
            height: 400,
            width: 400,
            child: Image(
              image: AssetImage(asset),
            ),
          ),
        ),
        Container(
          alignment: const Alignment(0, 0.5),
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        button ?? const SizedBox(),
      ],
    ),
  );
}
