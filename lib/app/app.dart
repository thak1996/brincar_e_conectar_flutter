import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.providers.dart';
import 'app.router.dart';
import 'core/constants/styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp.router(
        title: 'Brincar e Conectar',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: androidTheme(),
      ),
    );
  }
}
