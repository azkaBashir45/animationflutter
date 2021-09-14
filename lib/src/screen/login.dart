import 'package:flutter/material.dart';
import 'package:firstproject/src/screen/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  double opacityLevel = 0;
  double size = 50.0;
  bool large = false;
  void updateFunction() {
    setState(() {
      size = large ? 360 : 100;
      large = !large;
    });
  }

  double turns = 0.0;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );
  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 230),
              child: Expanded(
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(seconds: 10),
              vsync: this,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: size = !large ? 350 : 100,
                child: Expanded(
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "password",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RotationTransition(
              turns: _animation1,
              child: RaisedButton(
                child: Text("Login"),
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 2),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return Home();
                          }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
