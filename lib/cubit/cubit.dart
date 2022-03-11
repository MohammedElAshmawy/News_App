
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/network/local/cashe_Helper.dart';
import 'package:news_app/network/remote/Dio_Helper.dart';

class news_cubit extends Cubit<news_States>{
  news_cubit():super (newsInitialState());

  static news_cubit get(context)=> BlocProvider.of(context);


  int currentIndex=0;

  List<BottomNavigationBarItem> BottomNavigationBar=[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business
      ),
      label: 'business'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball
      ),
      label: 'sports'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science
      ),
      label: 'science'
    ),
  ];
 List<Widget> Screens=[
   business_screen(),
   sports_screen(),
   science_Screen(),
   settings_Screen(),
 ];

  void changeNavBar(int index)
  {
    currentIndex=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(newsBottomNavState());
  }

  List<dynamic> business=[];
  void getBusiness(){
    emit(newsGetBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'36f587a3285b42c687c2bb3a7bf2c27e',
      },
    ).then((value) {
      //print(value.data['totalResults'].toString());
      business=value.data['articles'];
      print(business[0]['title']);
      emit(newsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(newsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    emit(newsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'36f587a3285b42c687c2bb3a7bf2c27e',
        },
      ).then((value) {
        //print(value.data['totalResults'].toString());
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(newsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(newsGetSportsErrorState(error.toString()));
      });
    }
    else
      {newsGetSportsSuccessState();
      }

  }


  List<dynamic> science=[];
  void getScience(){
    emit(newsGetScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'36f587a3285b42c687c2bb3a7bf2c27e',
        },
      ).then((value) {
        //print(value.data['totalResults'].toString());
        science=value.data['articles'];
        print(science[0]['title']);
        emit(newsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(newsGetScienceErrorState(error.toString()));
        });
       }
       else{
         newsGetScienceSuccessState();
       }
      }


  bool isDark=false;

  void changeMode(){
    isDark=!isDark;
    cashHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(newsChangeModeState());
    });

  }



  List<dynamic> search=[];
  void getSearch(String value){
    emit(newsGetSearchLoadingState());
    search=[];

      DioHelper.getData(
        url:'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'36f587a3285b42c687c2bb3a7bf2c27e',
        },
      ).then((value) {
        //print(value.data['totalResults'].toString());
        search=value.data['articles'];
        print(search[0]['title']);
        emit(newsGetSearchSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(newsGetSearchErrorState(error.toString()));
      });
  }
}