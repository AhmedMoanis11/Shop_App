
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:shop_app/layout/home/cubitHone.dart';
import 'package:shop_app/layout/home/stateHome.dart';

import '../models/CategoriesModel.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome, StateHome>(
      listener: (context, state) {
       if(state is FavTogelLifght)
         {
           if(!state.model!.status)
             {
               Fluttertoast.showToast(
                   msg: 'Not Authorized ',
                   toastLength: Toast.LENGTH_LONG,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 5,
                   backgroundColor: Colors.red,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }
         }
      },
      builder: (context, state) {

          return ConditionalBuilder(condition: CubitHome.get(context).homemodel!=null && CubitHome.get(context).categoriesmodel!=null,
              builder:(context)=>ProductModel(CubitHome.get(context).homemodel!,CubitHome.get(context).categoriesmodel!,context),
              fallback: (context)=>Center(child: CircularProgressIndicator()));


      },
    );
  }

  ProductModel(HomeModel model,CategoriesModel modellCatg,context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data?.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage(
                        '${e.image}',
                      ),
                      width: double.infinity,
                      height: 400.0,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                autoPlayInterval: Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,

                        itemBuilder:(context,index)=>BuildCategories(modellCatg.data!.data![index]) ,
                        separatorBuilder:(context,index)=>SizedBox(
                          width: 15.0,
                        ) ,
                        itemCount:modellCatg.data!.data!.length ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'New Product',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 7.0,
                childAspectRatio: 1/1.77,
                children: List.generate(model.data!.products.length,
                        (index) => buildGridProduct(model.data!.products[index],context),
                ),

              ),
            ),
          ],
        ),
  );
  Widget BuildCategories(DataModel model)=> Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
     CircleAvatar(
       radius: 45,
       backgroundImage: NetworkImage(
         '${model.image}'
       ),
     ),
      Container(

        width: 100.0,
        color: Colors.black.withOpacity(0.7),
        child: Text(
          '${model.name!}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
  Widget buildGridProduct(productsModel model,context) =>
      Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children:[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: NetworkImage(model.image!),
              fit: BoxFit.fill,
              height: 200.0,
              width: double.infinity,

            ),
          ),
          if(model.discount!=0)
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
      Container(
        child: Column(
          children: [
            Text(
              '${model.name}',
              style: TextStyle(
                fontSize: 20.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10.0,
            ),

            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    '${model.price}',
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
                  if(model.discount!=0)
                  Text(
                    '${model.old_price}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      decoration: TextDecoration.lineThrough
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                  ),
                  Spacer(),
                  IconButton(onPressed: ()
                  {
                    CubitHome.get(context).ChangeFav(model.id!);
                    print('${model.id}');

                  }
                    , icon:CircleAvatar(
                      radius: 20,
                      backgroundColor: CubitHome.get(context).favourite![model.id]!?Colors.blue :Colors.grey.shade300,
                      child: Icon(
                        Icons.favorite_border,
                        size: 18.0,
                      ),
                    ), ),
                ],
              ),
            ),



          ],
        ),
      ),


    ],
  );
}
