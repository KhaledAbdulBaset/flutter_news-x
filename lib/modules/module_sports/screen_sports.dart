import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components.dart';
import '../../news_cubit/newsCubit.dart';
import '../../news_cubit/newsStates.dart';

class sportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(

      builder: (BuildContext context, newsStates state) {
        return ConditionalBuilder(

            condition:  newsCubit.get(context).SportsNewsList.length>0,



            builder: (context) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    return itemNewsBuilder(title: newsCubit.get(context).SportsNewsList[index]['title'],imageUrl:newsCubit.get(context).SportsNewsList[index]['image_url'] ,date: newsCubit.get(context).SportsNewsList[index]['pubDate'],context1: context ,url:newsCubit.get(context).SportsNewsList[index]['link'] );
                  },

                  separatorBuilder:(context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(height: 1,color: Colors.black,width: double.infinity,),
                  )
                  , itemCount: newsCubit.get(context).SportsNewsList.length);
            },



            fallback: (context) => Center(child: CircularProgressIndicator()));

      },

      listener: (BuildContext context, newsStates state) {  },

    );
  }


}