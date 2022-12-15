import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/login/StatesLogin.dart';
import 'package:shop_app/shared/dio.dart';

import '../../models/ModelLogin.dart';

class CubitSc extends Cubit<ShoppingApp>
{

  CubitSc():super(IntialStates());
  static CubitSc get(context)=>BlocProvider.of(context);
 IconData isshow = Icons.visibility_off;
 bool shown =true;
  late ShopLoginData LoginModel;
 void PasswordShow()
 {
   if(shown)
     {
       isshow=Icons.visibility;
       shown=!shown;
       emit(showpass());
     }
   else
     {
       isshow=Icons.visibility_off;
       shown=!shown;
       emit(showpass());
     }

 }
 void GetDataLogin(
  {
  required String Email,
  required String Password,
}
     )
 {
   emit(onLoadingLogin());
   Dioinfo.PostData(
       urll:'login'
   , data: {
     'email':Email,
     'password':Password,

   }).then((value) {
     print(value.data);
     LoginModel=ShopLoginData.JasonDatashop(value.data);
     print(LoginModel.message);


     emit(onsucessLogin(LoginModel));
   }).catchError((e)
   {
     print(e.toString());
     emit(onErrorLogin(e.toString()));
   });


 }


}
