import 'package:flutter/material.dart';

import 'features/home/presentations/home_screen/home_screen.dart';

class AsgardApp extends StatelessWidget {
  const AsgardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asgard World',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
