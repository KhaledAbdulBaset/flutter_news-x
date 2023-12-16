import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components.dart';
import '../../news_cubit/newsCubit.dart';
import '../../news_cubit/newsStates.dart';

class scienceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(

      builder: (BuildContext context, newsStates state) {
        return ConditionalBuilder(

            condition:  newsCubit.get(context).scienceNewsList.length>0,



            builder: (context) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    return itemNewsBuilder(url:newsCubit.get(context).scienceNewsList[index]['link'],context1: context,title: newsCubit.get(context).scienceNewsList[index]['title'],imageUrl:newsCubit.get(context).scienceNewsList[index]['image_url'] ,date: newsCubit.get(context).scienceNewsList[index]['pubDate'] );
                  },

                  separatorBuilder:(context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(height: 1,color: Colors.black,width: double.infinity,),
                  )
                  , itemCount: newsCubit.get(context).scienceNewsList.length);
            },



            fallback: (context) => Center(child: CircularProgressIndicator()));

      },

      listener: (BuildContext context, newsStates state) {  },

    );
  }


}