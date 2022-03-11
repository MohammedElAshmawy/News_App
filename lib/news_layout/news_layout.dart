
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/search_Screen.dart';
import 'package:news_app/network/remote/Dio_Helper.dart';

class news_layout extends StatelessWidget {
  const news_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<news_cubit,news_States>(
      listener:(context,state){} ,
      builder: (context,state){
        var cubit=news_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News app'),
            actions: [
              IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=>search_Screen(
                  ),
                ));
              },
              icon:Icon(Icons.search)),
              IconButton(
              onPressed: (){
                news_cubit.get(context).changeMode();
              },
              icon:Icon(Icons.brightness_4_outlined)),
            ],
           ),
          body:cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.BottomNavigationBar,
            currentIndex: cubit.currentIndex,
            onTap:(index){
              cubit.changeNavBar(index);
            },

          ),
        );
      },
    );
  }
}
