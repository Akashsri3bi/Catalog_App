import 'package:catalog/core/store.dart';

import 'package:catalog/pages/cart_page.dart';
import 'package:catalog/pages/home_detail_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalog/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        //  "/" is called route which is home now we can put either home page in home or in route
        "/": (_, __) => const MaterialPage(child: HomePage()),
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
        MyRoutes.homeDetailsRoute: (_, params) => MaterialPage(
                child: HomeDetailPage(
              catalog: params,
            )),
      }),
      themeMode: ThemeMode.system,
      theme: MyTheme.darkTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      //Routes is rasta which page we want to open this part when you are using simple Material Page
      /*
      initialRoute: MyRoutes.loginRoute,
      routes: {
        // "/" is called route which is home now we can put either home page in home or in route
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
      */
    );
  }
}
