import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/modules/module_health/health_screen.dart';
import 'package:newsapp1/modules/module_sports/screen_sports.dart';
import 'package:newsapp1/network/local/cash_helper.dart';
import 'package:newsapp1/network/remote/dio_helper.dart';

import '../modules/module_science/screen_science.dart';
import 'newsStates.dart';

class newsCubit extends Cubit<newsStates>{
  newsCubit(): super(appInitState());
  
  static newsCubit get(context)=>BlocProvider.of(context);
  
  int NavIndex=0;
  List<Widget> screens=[healthScreen(),scienceScreen(),sportsScreen()];
  List<String> screenTittles=["Health","Science","Sports",];
  List<Color> screenColor=[Color(0xff2e7d32),Color(0xff182232),Color(0xff4c0410),];

  void changeScreen(index){
    NavIndex=index;
    if(index==1){getScienceNews();}
    if(index==2){getSportsNews();}

    emit(appChangeScreentState());
  }

  List<dynamic> healthNewsList=[];

  void getHealthNews(){
    emit(appGetBusinessNewsStateLoading());
    dioHelper.get(url: "api/1/news",
        query:{
          "country":"eg",
          "category":"health",
          "apikey":"pub_326588fdde7bce47f2f1de438dd12a9bcfc8c"
        }

    ).then((value) {
      healthNewsList=value!.data['results'];
      print(healthNewsList[0]['title']);
      emit(appGetBusinessNewsState());
    }).catchError((error){
      print("Error WHEN GET API DATA : ${error}");
      emit(appGetBusinessNewsStateErorr(error.toString()));

    })

    ;
}


  List<dynamic> scienceNewsList=[];

  void getScienceNews(){
    emit(appGetScienceNewsStateLoading());

    if(scienceNewsList.length==0){
      dioHelper.get(url: "api/1/news",
          query:{
            "country":"eg",
            "category":"technology",
            "apikey":"pub_326588fdde7bce47f2f1de438dd12a9bcfc8c"
          }

      ).then((value) {
        scienceNewsList=value!.data['results'];
        print(scienceNewsList[0]['title']);
        emit(appGetScienceNewsState());
      }).catchError((error){
        print("Error WHEN GET API DATA : ${error}");
        emit(appGetScienceNewsStateErorr(error.toString()));

      })

      ;
    }
    else{
      emit(appGetScienceNewsState());

    }

  }

  List<dynamic> SportsNewsList=[];

  void getSportsNews(){
    emit(appGetSportsNewsStateLoading());
    if(SportsNewsList.length==0)
    {
      dioHelper.get(url: "api/1/news",
          query:{
            "country":"eg",
            "category":"sports",
            "apikey":"pub_326588fdde7bce47f2f1de438dd12a9bcfc8c"
          }

      ).then((value) {
        SportsNewsList=value!.data['results'];
        print(SportsNewsList[0]['title']);
        emit(appGetSportsNewsState());
      }).catchError((error){
        print("Error WHEN GET API DATA : ${error}");
        emit(appGetSportsNewsStateErorr(error.toString()));

      })

      ;
    }
    else{

      emit(appGetSportsNewsState());
    }

  }

  bool isDark=true;
  ThemeMode currentMode=ThemeMode.light;
  void changeMode({bool? fromShared}){

    if(fromShared!=null){
      isDark=fromShared;
    }
    else{
      isDark=!isDark;
    }

    casheHelper.setData(key: "isDark", value: isDark).then((value) {
      emit(appChangeMode());

        });

  }
     // if(isDark){
     //   isDark=false;
     //   currentMode=ThemeMode.light;
     //   print("change to light");
     //   emit(appChangeMode());
     // }
     // else{
     //   isDark=true;
     //   currentMode=ThemeMode.dark;
     //   print("change to dark");
     //   emit(appChangeMode());





}