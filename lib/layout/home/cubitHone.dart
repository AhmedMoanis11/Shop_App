import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constences/constanse.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/layout/home/stateHome.dart';

import '../../models/CategoriesModel.dart';
import '../../models/FavModel.dart';
import '../../models/FavModelData.dart';
import '../../models/HomeModel.dart';
import '../../models/ModelLogin.dart';
import '../../moduels/categories.dart';
import '../../moduels/favourite.dart';
import '../../moduels/product.dart';
import '../../moduels/setting.dart';

class CubitHome extends Cubit<StateHome> {
  CubitHome() : super(IntialHomeState());

  static CubitHome get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;
  List<Widget> HomeScreen = [
    ProductScreen(),
    Categories(),
    FavourtieHome(),
    Setting(),
  ];
  List<String> HomeScreenString = [
    'Home',
    'Categories',
    'Favourite',
    'Setting',
  ];

  void ChangeBottomNavBar(int index) {
    CurrentIndex = index;
    emit(ChangeBottomNav());
  }
   HomeModel?  homemodel;
  Map<int,bool>? favourite={};
  void GetHomeDat()
  {
    emit(onLoadingHome());
     Dioinfo.GetData(
         urll: 'home',
       token: token,

     ).then((value) {
       homemodel=HomeModel.JasonDatashop(value.data);
      print(homemodel?.data?.banners[0].image);
      print(homemodel?.data?.products[3].in_favorites);

       homemodel!.data!.products.forEach((element) {
         favourite!.addAll({
           element.id!:element.in_favorites!,
         });

       });
       print(favourite.toString());

       emit(onSucessHome());

     }).catchError((e)
     {
       print(e.toString());
       emit(onErrorHome());
     });
  }

  CategoriesModel?  categoriesmodel;
  void GetCategoriesData()
  {
    Dioinfo.GetData(
      urll: 'categories',


    ).then((value) {
      categoriesmodel=CategoriesModel.jasondata(value.data);

      emit(onSucessCategories());

    }).catchError((e)
    {
      print(e.toString());
      emit(onSucessCategories());
    });
  }
  FavouriteModel? favouriteModel;
  void ChangeFav(int product_id)
  {
    favourite![product_id]=!favourite![product_id]!;
     emit(FavTogelLifght(favouriteModel));

    Dioinfo.PostData(
        urll: 'favorites',
        data: {
          'product_id':product_id,
        },
        token: token,
    ).then((value) {
      favouriteModel=FavouriteModel.jasondata(value.data);
      print(value.data);
      if(!favouriteModel!.status)
        {
          favourite![product_id]=!favourite![product_id]!;

        }
      else
        {
          FavouriteData();
        }
      emit(OnChangeFavSucess());
    }).catchError((e)
    {
      favourite![product_id]=!favourite![product_id]!;

      print(e.toString());
      emit(OnChangeFavError());

    });


  }


  FavModelData?favModelData;
  void FavouriteData()
  {
    emit(GetFavLoading());
    Dioinfo.GetData(
      urll: 'favorites',
      token: token,


    ).then((value) {
      favModelData=FavModelData.fromJson(value.data);
      print(value.data.toString());

      emit(GetFavSucess());

    }).catchError((e)
    {
      print(e.toString());
      emit(GetFavError());
    });



  }



}
