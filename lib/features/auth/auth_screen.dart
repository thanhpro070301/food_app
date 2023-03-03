import 'package:flutter/material.dart';
import '../../common_widgets/widget/line_tab.dart';
import '../../constants/assets_constants.dart';
import '../../constants/theme/pallete.dart';
import 'signin/signin_screen.dart';
import 'signup/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<Tab> myTabs = <Tab>[
    const Tab(
      text: "Sign In",
    ),
    const Tab(
      text: 'Sign Up',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.38,
              decoration: const BoxDecoration(
                color: Palette.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 192, 192, 192),
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AssetsConstants.hat_img,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TabBar(
                    indicator: const LineTabIndicator(
                      color: Palette.backgroundOrange1,
                      lineHeight: 1.5,
                      strokeWidth: 3,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: const Color(0xffA8A8A8),
                    controller: _tabController,
                    labelStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    tabs: myTabs.map((e) => e).toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SignInScreen(),
                  SignUpScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
