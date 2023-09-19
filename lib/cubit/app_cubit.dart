import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/network/local/cacheHelper.dart';


import '../modules/science_screen.dart';
import '../modules/settings_screen.dart';
import '../modules/sport_screen.dart';
import '../modules/top_screen.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());

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
  List search = [];
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

  void getSearch (value) {
    emit(Loding());
    DioHelper.getData('api/1/news',
        {
          'q' : '$value',
          'apiKey': 'pub_28793fc9a3e454f2a8bd56e834c38948d309d'
        }).then((value) {
      search = value.data['results'];
      emit(GetSearch());
    }).catchError((error) {
      print(error);
      emit(GetsearchError());
    });
  }
  bool isDark = false;
  TextStyle myTextStyle = TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,);
  void changeThemeMode ({bool? fromShared})
  {
    if (fromShared != null)
      {
        isDark = fromShared;
        emit(ChangeMode());
      }else
        {

          isDark = !isDark;
          CacheHelper.putboolean(key: 'isDark', value: isDark)?.then((value) {
            emit(ChangeMode());
          });
        }
    if (isDark)
      {
        myTextStyle = TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,);
      }else {
        myTextStyle = TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,);
    }
    print(isDark);

  }
}