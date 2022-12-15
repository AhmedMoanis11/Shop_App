import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/Regist/stateRegist.dart';

import '../../models/ModelLogin.dart';
import '../../shared/dio.dart';

class CubitRegist extends Cubit<RegistState>
{

  CubitRegist():super(IntialStateRegist());

  static CubitRegist get(context)=>BlocProvider.of(context);

  IconData isshow = Icons.visibility_off;
  bool shown =true;
  late ShopLoginData LoginModel;
  void PasswordShow() {
    if (shown) {
      isshow = Icons.visibility;
      shown = !shown;
      emit(showReistpass());
    }
    else {
      isshow = Icons.visibility_off;
      shown = !shown;
      emit(showReistpass());
    }
  }


  void GetRegist(
      {
        required String Name,
        required String phone,
        required String Email,
        required String Password,


      }
      )
  {
    emit(OnLoadingRegist());
    Dioinfo.PostData(
        urll:'register'
        , data: {
          'name':Name,
      'phone':phone,
      'email':Email,
      'password':Password,

    }).then((value) {
      print(value.data);
      LoginModel=ShopLoginData.JasonDatashop(value.data);
      print(LoginModel.message);


      emit(OnSucessRegist(LoginModel));
    }).catchError((e)
    {
      print(e.toString());
      emit(OnErrorRegist(e.toString()));
    });


  }




}