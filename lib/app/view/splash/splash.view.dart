import 'package:brincar_e_conectar_flutter/app/core/constants/app.icon.dart';
import 'package:brincar_e_conectar_flutter/app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2500), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon.splash(size: 100, color: accentColor),
            const SizedBox(height: 20),
            Text(
              'Brincar e Conectar',
              style: TextStyle(
                color: accentColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(color: accentColor),
          ],
        ),
      ),
    );
  }
}
