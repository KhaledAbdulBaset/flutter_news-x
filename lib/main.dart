import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/layouts/news_layout/news_layout.dart';
import 'package:newsapp1/network/local/cash_helper.dart';
import 'package:newsapp1/news_cubit/newsCubit.dart';
import 'package:newsapp1/news_cubit/newsStates.dart';

import 'network/remote/dio_helper.dart';
import 'news_cubit/blocObserver.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.dioInit();
  await casheHelper.init();

  bool? isDark=casheHelper.getData(key: "isDark");
  runApp(myApp(isDark));
}

class myApp extends StatelessWidget{
  ThemeMode? c;
final isDark;
  myApp(this.isDark);
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) { return newsCubit()..changeMode(
        fromShared: isDark
      ); },
      child: BlocConsumer<newsCubit,newsStates>(
        builder: (BuildContext context, newsStates state) {
          newsCubit newsCubit1 = newsCubit.get(context);
          print(newsCubit1.currentMode.toString());
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),

              ),
              textTheme: TextTheme(

                bodyMedium: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black

                ),

              ),


            ),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,

                    systemNavigationBarIconBrightness: Brightness.light,

                  ),
                  backgroundColor: Color(0xff333739),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700

                  ),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  ),
                ),
                scaffoldBackgroundColor: Color(0xff333739),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white

                  ),

                ),

                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,

                  type: BottomNavigationBarType.fixed,
                  unselectedIconTheme: IconThemeData(color: Colors.grey),

                )




            ),
            themeMode:c=newsCubit1.isDark?ThemeMode.dark:ThemeMode.light,

            debugShowCheckedModeBanner: false,
            home:newsLayout(c),

          );

        },
        listener: (BuildContext context, newsStates state) {  },
      ),
    );
  }

}