import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/CategoriesModel.dart';
import 'package:shop_app/layout/home/cubitHone.dart';
import 'package:shop_app/layout/home/stateHome.dart';

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<CubitHome,StateHome>
     (
     listener: (context,state)
       {

       },
       builder: (context,state)
       {
         return ListView.separated(
           shrinkWrap: true,
           physics: BouncingScrollPhysics(),
             itemBuilder: (context,index)=>BuildCarShape(CubitHome.get(context).categoriesmodel!.data!.data![index])
             , separatorBuilder:(context,index)=>SizedBox(
height: 15.0,
             ) ,
             itemCount:CubitHome.get(context).categoriesmodel!.data!.data!.length );
       },
   );
  }
  Widget BuildCarShape(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Expanded(
      child: Row
        (
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                '${model.image}'
            ),
          ),
          SizedBox(width: 20.0,),
          Text(
            '${model.name}',
            style: TextStyle(
              fontSize: 20.0,

            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    ),
  );
}
