import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/bloc_observer.dart';
import 'package:news_app/network/local/cashe_Helper.dart';
import 'package:news_app/network/remote/Dio_Helper.dart';
import 'package:news_app/news_layout/news_layout.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.Init();
  await cashHelper.Init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   MultiBlocProvider(
      
      providers: [
        BlocProvider(create: (context)=>news_cubit()
        ),
        BlocProvider(create: (BuildContext context)=>news_cubit()..getBusiness()
          ,)
      ],
      child: BlocConsumer<news_cubit,news_States>(
        listener:(context,state){} ,
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch:Colors.orange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.white,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange,
              ),
            ),
            darkTheme:ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              primarySwatch:Colors.orange,
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: HexColor('333739'),
                backwardsCompatibility: false,
                iconTheme: IconThemeData(
                    color: Colors.white
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness: Brightness.dark
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            themeMode: news_cubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:news_layout(),


          );
        }
      ),
    );

  }
}


