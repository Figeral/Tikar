import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tikar/view/desktop/desktop.dart';
import 'package:tikar/view/desktop/pages/content/app_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Desktop()));
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (_) => const AppContent()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const Center(
        child: Image(
          width: 400,
          height: 400,
          image: AssetImage("assets/images/tikar.png"),
        ),
      ),
    );
  }
}
