import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../shared/shared.dart';

import 'home_screen.dart';
import 'network/remote/dio_helper.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.orange,
            selectedLabelStyle: TextStyle(color: Colors.orange),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,),
      ),
      home: Directionality(textDirection: TextDirection.rtl,
          child: const HomeScreen()),
    );
  }
}
