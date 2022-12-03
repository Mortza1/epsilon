import 'dart:async';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: EpsilonPages.splashScreen,
        key: ValueKey(EpsilonPages.splashScreen),
        child: const SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  double _width = 50;
  double _height = 50;

  _SplashScreenState() {
    _timer = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _width = 500;
        _height = 500;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5e17ff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _height,
                width: _width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/splashE.png'), fit: BoxFit.cover),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
