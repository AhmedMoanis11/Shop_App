import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/search/SearchCubit.dart';


import '../layout/search/SearchStates.dart';
import '../models/FavModelData.dart';

class Search extends StatelessWidget {
 var txtcontroller =TextEditingController();


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) =>CubitSearch(),
      child: BlocConsumer<CubitSearch,SearchState>(
        listener: (context,state)
        {

        },
        builder: (context,state)
        {

          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(

                      child: TextFormField(
                        controller:txtcontroller ,
                        onFieldSubmitted: (String textt)
                        {
                          CubitSearch.get(context).SearchData(textt);

                        },
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,

                          ),

                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(18.0),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    if(state is OnLoadingSearch)
                    LinearProgressIndicator(),
                    TabBar(
                       tabs: [
                         Tab(
                           text:'All',icon: Icon(Icons.border_all_outlined),

                         ),
                         Tab(
                           text:'Electricl',icon: Icon(Icons.electric_bolt),

                         ),
                         Tab(
                           text:'Food',icon: Icon(Icons.emoji_food_beverage),

                         ),
                         Tab(
                           text:'Sports',icon: Icon(Icons.sports_soccer),

                         ),
                       ],
                    ),
                    if(state is OnSucessSearch)
                    SizedBox(
                      height: 620,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),

                          itemBuilder:(context,index)=>SerachView(CubitSearch.get(context).searchModelData!.data!.data![index])
                          , separatorBuilder: (context,index)=>Container(
                        height: 1.5,
                        width: 1.5,
                        color: Colors.grey,
                      )
                          , itemCount:  CubitSearch.get(context).searchModelData!.data!.data!.length),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
 Widget SerachView( model)=>SingleChildScrollView(
   child: Padding(
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
                   image: NetworkImage('${model!.image}'),
                   height: 100.0,
                   width: 100.0,
                   fit: BoxFit.cover,


                 ),
                 SizedBox(width: 20,),

               ] ,
             ),
           ),
           SizedBox(width: 50,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
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

                 Row(
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



                   ],
                 ),



               ],
             ),
           ),


         ],
       ),
     ),
   ),
 );

}
