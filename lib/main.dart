import 'package:tikar/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///crash test window size adaptivity

  // WindowManager windowManager = WindowManager.instance;
  // await windowManager.ensureInitialized();
  // try {
  //   WindowOptions windowOptions =
  //       const WindowOptions(center: true, size: Size(1000, 650));
  //   await windowManager.waitUntilReadyToShow(windowOptions, () async {
  //     await windowManager.show();
  //     await windowManager.focus();
  //   });
  // } catch (e) {
  //   log(" Following error occured in \n $e");
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),

        // title: "hello world",
        //theme: ThemeData(fontFamily: "AbyssinicaSIL"),
        theme: ThemeData(fontFamily: "Poppins"));
  }
}
