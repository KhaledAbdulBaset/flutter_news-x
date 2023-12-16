import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/network/remote/dio_helper.dart';
import 'package:newsapp1/news_cubit/newsCubit.dart';
import 'package:newsapp1/news_cubit/newsStates.dart';

class newsLayout extends StatelessWidget{

  ThemeMode? m;
  newsLayout(this.m);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return newsCubit.get(context)..getHealthNews(); },
      child: BlocConsumer<newsCubit,newsStates>(
        builder: (BuildContext context, state) {
          newsCubit newsCubitObj=newsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(14)),
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xff7fbfbe),Color(0xffd2f3ee)]

                    )

                    ),
                  ),
                  ClipPath(
                    clipper: CustomClipperClass(),
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black,offset: Offset(1,1),spreadRadius: 2,blurRadius: 5)],
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Color(0xfffad126),Color(0xffff546e)]

                          ),
                           borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: Text("News-X",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),)),
                  ),
                ],
              ),
              title: Center(child: Text(newsCubitObj.screenTittles[newsCubitObj.NavIndex],style: TextStyle(fontSize: 20),)),
              flexibleSpace: Container(width: double.infinity,color: newsCubitObj.screenColor[newsCubitObj.NavIndex],),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){

                  newsCubit.get(context).changeMode();
                  print("${m.toString()}");
                }, icon: Icon(Icons.brightness_4_outlined)),


              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index){
                  newsCubitObj.changeScreen(index);
                },
                currentIndex: newsCubitObj.NavIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: newsCubitObj.screenColor[newsCubitObj.NavIndex],
                selectedIconTheme: IconThemeData(color: newsCubitObj.screenColor[newsCubitObj.NavIndex],)
                ,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.healing_outlined),label: "Health"),
                  BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label:"Science"),
                  BottomNavigationBarItem(icon: Icon(Icons.sports_football),label: "Sports"),

                ]),
            body: newsCubitObj.screens[newsCubitObj.NavIndex],


          );
        },

        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }




}

class CustomClipperClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w= size.width;
    double h= size.height;
    final path=Path();

    path.lineTo(0, h*0.8);
   path.quadraticBezierTo(w*0.1, h, w*0.2, h*0.8);
    path.quadraticBezierTo(w*0.5, h, w*0.8, h*0.8);
    path.quadraticBezierTo(w*0.9, h, w, h*0.8);

    path.lineTo(w, 0.15);
    path.quadraticBezierTo(w*0.9, 0, w*0.8, h*0.15);
    path.quadraticBezierTo(w*0.5, h*0.15, w*0.2, h*0.15);



    path.close();




    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}