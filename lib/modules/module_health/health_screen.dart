import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/components.dart';
import 'package:newsapp1/news_cubit/newsCubit.dart';
import 'package:newsapp1/news_cubit/newsStates.dart';
import 'shared/components.dart';
class healthScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(

      builder: (BuildContext context, newsStates state) {
        return ConditionalBuilder(

            condition:  newsCubit.get(context).healthNewsList.length>0,



            builder: (context) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                return itemNewsBuilder(url:newsCubit.get(context).healthNewsList[index]['link'],title: newsCubit.get(context).healthNewsList[index]['title'],imageUrl:newsCubit.get(context).healthNewsList[index]['image_url'] ,date: newsCubit.get(context).healthNewsList[index]['pubDate'],context1: context );
              },

                  separatorBuilder:(context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(height: 1,color: Colors.black,width: double.infinity,),
                  )
                  , itemCount: newsCubit.get(context).healthNewsList.length);
            },



            fallback: (context) => Center(child: CircularProgressIndicator()));

      },

      listener: (BuildContext context, newsStates state) {  },

    );
  }


}