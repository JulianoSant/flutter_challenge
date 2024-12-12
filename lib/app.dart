import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_theme.dart';
import 'views/home_page.dart';
import 'views/questions_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/questions': (context) => const QuestionsPage(),
      },
    );
  }
}
