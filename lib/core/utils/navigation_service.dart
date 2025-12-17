import 'package:flutter/material.dart';

class NavigatorService {
  // static GlobalKey<NavigatorState> navigatorKey  =GlobalKey<NavigatorState>();
   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName,{
      dynamic argument,
    }) async{
      return navigatorKey.currentState?.pushNamed(routeName,arguments: argument);
    }

    static void goBack(){
      return navigatorKey.currentState?.pop();
    }

   static Future<dynamic> pushNamedAndRemoveUntil(
  String routeName, {
  dynamic argument,
}) async {
  return navigatorKey.currentState?.pushNamedAndRemoveUntil(
    routeName,
    (route) => false, // <-- THIS removes all previous routes
    arguments: argument,
  );
}


      static Future<dynamic> popAndPushNamed(
        String routeName,{
          dynamic arguments,
        }) async {
          return navigatorKey.currentState?.popAndPushNamed(routeName, arguments: arguments);
        }

        static Future<dynamic> pushReplacement(
          String routeName, {
            dynamic argument,
          }) async {
            return navigatorKey.currentState?.pushReplacementNamed(routeName,arguments: argument);
          }
}