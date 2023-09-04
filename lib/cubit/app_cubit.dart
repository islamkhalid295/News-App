import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../modules/science_screen.dart';
import '../modules/settings_screen.dart';
import '../modules/sport_screen.dart';
import '../modules/top_screen.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(super.initialState);

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const TopScreen(),
    const SportScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  void changBottomNavBar(int value){
    currentIndex = value;
    emit(BottomNavBarState());
  }

  List Top = [];
  List Sports = [];
  List Science = [];
  void getNews (){
    emit(Loding());
    DioHelper.getData('api/1/news',
    {'country':'eg', 'category' : 'Top' ,'apiKey' : 'pub_28793fc9a3e454f2a8bd56e834c38948d309d'}).then((value) {
      Top = value.data['results'];

      emit(GetData());
    }).catchError((error){
      print(error);
      emit(GetDataError());
    });

    DioHelper.getData('api/1/news',
        {'country':'eg', 'category' : 'Sports' ,'apiKey' : 'pub_28793fc9a3e454f2a8bd56e834c38948d309d'}).then((value) {
      Sports = value.data['results'];

      emit(GetData());
    }).catchError((error){
      print(error);
      emit(GetDataError());
    });

    DioHelper.getData('api/1/news',
        {'country':'eg', 'category' : 'science' ,'apiKey' : 'pub_28793fc9a3e454f2a8bd56e834c38948d309d'}).then((value) {
      Science = value.data['results'];
      emit(GetData());
    }).catchError((error){
      print(error);
      emit(GetDataError());
    });

  }
}