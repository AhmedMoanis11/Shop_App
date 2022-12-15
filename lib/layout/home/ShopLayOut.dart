import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_button/menu_button.dart';
import 'package:shop_app/moduels/Search.dart';
import 'package:shop_app/layout/home/cubitHone.dart';
import 'package:shop_app/layout/home/stateHome.dart';

import '../../moduels/onbording.dart';


class ShopLatOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome,StateHome>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(

              CubitHome.get(context).HomeScreenString[CubitHome.get(context).CurrentIndex],
            ),
            actions: [
              

              
              
              TextButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                  }, child: Icon(
                Icons.search_rounded,
                color: Colors.black,

              ),
              ),
        PopupMenuButton(
        icon: Icon(
        Icons.more_vert,
        ),
      itemBuilder:(context)=>[
      PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.logout,
              ),

              TextButton(onPressed: ()
                  {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OnBording()), (route) => false);


                  }, child: Text(
                'Log out',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),),
            ],
          ),


      ),
      PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.settings,
            ),

           TextButton(onPressed:()
               {

               }, child:Text(
               'Setting',
             style: TextStyle(
               color: Colors.black,
             ),
           ), ),
          ],
        ),
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.share,
            ),

           TextButton(onPressed:()
               {

               }, child:Text(
               'Share',
             style: TextStyle(
               color: Colors.black,
             ),
           ), ),
          ],
        ),
      ),
      ] ,

      ),
            ],
          ),
          body:CubitHome.get(context).HomeScreen[CubitHome.get(context).CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: CubitHome.get(context).CurrentIndex,
            onTap: (value)
            {
              CubitHome.get(context).ChangeBottomNavBar(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon
                    (
                      Icons.home
                  ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon
                  (
                    Icons.apps
                ),
                label: 'category',
              ),
              BottomNavigationBarItem(
                icon: Icon
                  (
                    Icons.favorite
                ),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon
                  (
                    Icons.settings
                ),
                label: 'settings',
              ),


            ],
          ),
        );
      },
    );
  }
}
//TextButton(
//             onPressed: ()
//             {
//               CacheHelper.removeshard(key: 'token').then((value) {
//                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginShopApp()), (route) => false);
//               });
//
//             },child: Text(
//             'Sign out',
//           ),
//           ),