import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';

import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 40), 
      () => getRoute());
  }

   void getRoute() async {
    Navigator.of(context).pushNamed(AppRoutes.home);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body:  Center(
              child: SizedBox(
                width: size.width *.6,
                height: size.height *.6,
                child: const Center(
                    child: Image(
                  image: AssetImage('asset/images/logo.png'),
                )),
              ),
            ),
    );
  }
}