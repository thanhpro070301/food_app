import 'package:flutter/material.dart';
import 'package:food_app/shared/shared.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const LoginSignUpScreen(),
      );
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<Tab> myTabs = <Tab>[
    const Tab(
      text: "Login",
    ),
    const Tab(
      text: 'Sign-up',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
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
                          fit: BoxFit.cover),
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
                    labelStyle: const TextStyle(fontSize: 20),
                    tabs: myTabs.map((e) => e).toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LoginScreen(),
                  SignupScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LineTabIndicator extends Decoration {
  final double strokeWidth;
  final double lineHeight;
  final Color color;

  const LineTabIndicator({
    required this.strokeWidth,
    required this.lineHeight,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LinePainter(
      strokeWidth: strokeWidth,
      lineHeight: lineHeight,
      color: color,
    );
  }
}

class _LinePainter extends BoxPainter {
  final double strokeWidth;
  final double lineHeight;
  final Paint _paint;

  _LinePainter({
    required this.strokeWidth,
    required this.lineHeight,
    required Color color,
  }) : _paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final left = offset.dx + 40;
    final top = offset.dy + cfg.size!.height - lineHeight;
    final right = offset.dx + cfg.size!.width - 40;
    final bottom = offset.dy + cfg.size!.height;
    final line = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(line, _paint);
  }
}
