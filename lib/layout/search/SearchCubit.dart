import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constences/constanse.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/models/searchModel.dart';

import 'SearchStates.dart';

class CubitSearch extends Cubit<SearchState>
{
  CubitSearch():super(IntialState());

 static CubitSearch get(context)=>BlocProvider.of(context);

  SearchModelData?searchModelData;

   void SearchData(String Text)
   {
     emit(OnLoadingSearch());

     Dioinfo.PostData(
         urll: 'products/search'

         , data:{
        'text':Text,
     },
       token: token,
     ).then((value) {
       searchModelData=SearchModelData.fromJson(value.data);

       emit(OnSucessSearch());


     }).catchError((e)
     {
       print(e.toString());
       emit(OnErrorSearch());
     });



   }







}