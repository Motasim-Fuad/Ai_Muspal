import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ✅ Required for SVGs

import '../../resource/asseets/image_assets.dart';
import '../View_Model/Services/Splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageAssets.logo,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            SvgPicture.asset(
              ImageAssets.splashScreen,
            ),
          ],
        ),
      ),
    );
  }
}
