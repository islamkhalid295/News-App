import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitState())..getNews(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  "News App",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_fire_department_outlined),
                    label: "Top",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: "sports",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.science_rounded),
                    label: "science",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "settings",
                  ),
                ],
                onTap: (value) {
                  AppCubit.get(context).changBottomNavBar(value);
                },
                currentIndex: cubit.currentIndex),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
