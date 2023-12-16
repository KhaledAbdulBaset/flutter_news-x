import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/modules/web_view/web_screen.dart';

Widget itemNewsBuilder ({
  required var imageUrl,
  required String title,
  required String date,
  required context1,
  required String url

})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: MaterialButton(
    onPressed: () {
      Navigator.push(context1, MaterialPageRoute(builder: (context) {
        return webScreen(url);
      },));

    },
    child: Row(
      children: [
        Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: imageUrl==null?CircleAvatar(backgroundColor: Colors.grey[300],child: Text("no Image",style: TextStyle(color: Colors.white),)):Image(image: NetworkImage(imageUrl),fit: BoxFit.fill,)),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(title,style: Theme.of(context1).textTheme.bodyMedium,maxLines: 4,overflow: TextOverflow.ellipsis,))
                ,Text(date,style: TextStyle(fontSize: 10,color: Colors.grey[500],),maxLines: 1,overflow: TextOverflow.ellipsis,)

              ],),
          ),
        )

      ],),
  ),
);