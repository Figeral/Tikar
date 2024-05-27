import 'package:flutter/material.dart';
import 'package:tikar/view/desktop/pages/landing/authentification/pages/login.dart';
import 'package:tikar/view/desktop/pages/landing/authentification/pages/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: sWidth,
        height: sHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(125, 219, 208, 219),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: sWidth * 0.40,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Image(
                      image: const AssetImage("assets/images/ui3.png"),
                      height: sHeight * 0.5,
                      width: sWidth * 0.4,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: sWidth * 0.6,
              height: sHeight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    sWidth * 0.10, sWidth * 0.05, sWidth * 0.15, sWidth * 0.15),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "connexion",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Poppins"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TabBar(
                        controller: _tabController,
                        tabs: [tabMaker("LogIn"), tabMaker("SignIn")],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            //Center(child: Text("Hello Login")),
                            Login(),
                            SignIn()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }

  Tab tabMaker(String text) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
