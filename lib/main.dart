import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/home_screen/home_screen.dart';
import 'package:movies/screens/home_tab/home_details.dart';
import 'package:movies/screens/home_tab/home_tab.dart';
import 'package:movies/screens/splash_screen/splash_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize:const Size(412,892),
     minTextAdapt:true,
     splitScreenMode:true,
     builder:(context,child){
       return MaterialApp(
         debugShowCheckedModeBanner:false,
         initialRoute:SplashScreen.SplashScreenRoute,
         routes:{
           SplashScreen.SplashScreenRoute: (context) => SplashScreen(),
           HomeScreen.routeName:(context)=>HomeScreen(),
           HomeDetails.routeName:(context)=>HomeDetails(),
           Home.routeName:(context)=>Home()
         },
       );
     },
   );
  }
}
