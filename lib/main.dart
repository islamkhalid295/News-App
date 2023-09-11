import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/cubit/app_cubit.dart';
import 'package:my_flutter_app/cubit/app_state.dart';
import 'package:my_flutter_app/network/local/cacheHelper.dart';
import '../shared/shared.dart';

import 'home_screen.dart';
import 'network/remote/dio_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getboolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  MyApp(this.isDark);
  bool? isDark;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit()..getNews()..changeThemeMode(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppState>(
        listener:(context, state) {},
        builder: (context, state) {
          return   MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Colors.orange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(backgroundColor: Colors.orange[100]),
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
            darkTheme:ThemeData(
              scaffoldBackgroundColor: Colors.grey[800],
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.grey[900],titleTextStyle: TextStyle(color: Colors.white)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[900],
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
        },
      ),
    );
  }
}
