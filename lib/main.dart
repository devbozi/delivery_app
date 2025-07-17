import 'package:delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/main_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        primaryColor: AppColors.primary,
        fontFamily: 'SF Pro Display',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
          ),
        )
      ),
      home:  const MainScreen(),
      routes: {},
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

