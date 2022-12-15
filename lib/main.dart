import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/Regist/CubitRegist.dart';
import 'package:shop_app/layout/home/ShopLayOut.dart';
import 'package:shop_app/layout/home/cubitHone.dart';
import 'package:shop_app/layout/login/cubitLogin.dart';
import 'package:shop_app/layout/login/login.dart';
import 'package:shop_app/shared/shared_pre.dart';

import 'shared/BlocObserver.dart';
import 'constences/constanse.dart';
import 'shared/dio.dart';
import 'moduels/onbording.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Dioinfo.init();
  await CacheHelper.init();
  Widget widget;
  bool? OnBoarding=CacheHelper.getData(key: 'OnBoarding');
   token=CacheHelper.getData(key: 'token');
   print(token);
  print(OnBoarding);
  if(OnBoarding!=null)
    {
      if(token!=null)
        {
          widget=ShopLatOut();
        }
      else
        {
          widget=LoginShopApp();
        }

    }
  else
    {
      widget=OnBording();
    }

  runApp( MyApp(StartWidget: widget,));


}

class MyApp extends StatelessWidget {
 late final Widget StartWidget;


  // This widget is the root of your application.

MyApp({required this.StartWidget});

 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CubitSc()),
        BlocProvider(create: (context)=>CubitHome()..GetHomeDat()..GetCategoriesData()..FavouriteData()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            labelColor: Colors.teal,

          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.teal,
              statusBarBrightness: Brightness.dark,
            ),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              color: Colors.black
            ),

            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
            iconTheme: IconThemeData(

              color: Colors.black,
            ),


          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(
              color: Colors.black,
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.teal,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.teal,
          ),

        ),
        debugShowCheckedModeBanner: false,
        home:StartWidget,
      ),
    );
  }
}
