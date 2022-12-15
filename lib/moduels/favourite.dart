import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home/cubitHone.dart';
import 'package:shop_app/layout/home/stateHome.dart';

import '../models/FavModelData.dart';

class FavourtieHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome,StateHome>
      (
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
        return ConditionalBuilder(
          condition: state is! GetFavLoading ,
          builder: (context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder:(context,index)=>BuildFavWidget(CubitHome.get(context).favModelData!.data!.data![index],context)
              , separatorBuilder: (context,index)=>Container(height: 3.0,width: 3.0,)
              , itemCount: CubitHome.get(context).favModelData!.data!.data!.length),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );
      },

       );


  }
  Widget BuildFavWidget(FavData model,context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children:[
                Image(
                  image: NetworkImage('${model.product!.image}'),
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,


                ),
                SizedBox(width: 20,),
                if(model.product!.discount!=0)
                Container(
                  color: Colors.yellowAccent,
                  child: Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ] ,
            ),
          ),
          SizedBox(width: 50,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.product!.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.0,
                ),

                Row(
                  children: [
                    Text(
                      '${model.product!.price}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.teal
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    if(model.product!.discount!=0)
                    Text(
                      '${model.product!.discount}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                    IconButton(onPressed: ()
                    {
                      CubitHome.get(context).ChangeFav(model.product!.id!);
                      //print('${model.id}');

                    }
                      , icon:CircleAvatar(
                        radius: 20,
                        backgroundColor: CubitHome.get(context).favourite![model.product!.id]!?Colors.blue :Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          size: 18.0,
                        ),
                      ), ),
                  ],
                ),



              ],
            ),
          ),


        ],
      ),
    ),
  );
}
