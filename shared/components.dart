import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemNewsBuilder ({
  required String imageUrl,
  required String title,
  required String date

})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: MaterialButton(
    onPressed: () {  },
    child: Row(
      children: [
        Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(image: NetworkImage(imageUrl),fit: BoxFit.fill,)),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),maxLines: 4,overflow: TextOverflow.ellipsis,)
                ,Text(date,style: TextStyle(fontSize: 10,color: Colors.grey[500],),maxLines: 1,overflow: TextOverflow.ellipsis,)

              ],),
          ),
        )

      ],),
  ),
);