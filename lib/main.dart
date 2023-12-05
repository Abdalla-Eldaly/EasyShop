import 'package:esayshop/di/di.dart';
import 'package:esayshop/provider/Provider.dart';
import 'package:esayshop/provider/currentprovider.dart';
import 'package:esayshop/ui/auth/login/Login.dart';
import 'package:esayshop/ui/auth/register/Register.dart';
import 'package:esayshop/ui/common/product/productDetails/productDetails.dart';
import 'package:esayshop/my_theme.dart';
import 'package:esayshop/ui/homeFragmentation/homePage/DetailsViewAll/DetailsViewAll.dart';
import 'package:esayshop/ui/homeFragmentation/homePage/HomeScreen.dart';
import 'package:esayshop/ui/homeFragmentation/homePage/HomeTab/HomeTab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'data/database/firebase_options.dart';

void main() async {

  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(
            create: (_) => CounterProvider()), // Add CounterProvider here
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void intiState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print('user signout####################');
      }else{
        print('singin#################3333');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 939),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SnapShop',
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.transparent),
          appBarTheme: const AppBarTheme(
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: MyTheme.primaryColor,
              size: 30,
            ),
          ),
          primaryColor: MyTheme.discountColor,
          textTheme: const TextTheme(
              labelLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: MyTheme.primaryColor),
              labelMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyTheme.primaryColor),
              labelSmall: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: MyTheme.primaryColor),
              bodyMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MyTheme.primaryColor)),
        ),
        home:(FirebaseAuth.instance.currentUser!=null
        )? HomeScreen():Login(),
        routes: {
          HomeTab.routeName: (_) => HomeTab(),
          HomeScreen.routeName: (_) => HomeScreen(),
          ProductDetails.routeName: (_) => ProductDetails(),
          ViewAll.routeName: (_) => ViewAll(),
          Login.routeName: (_) => Login(),
          Register.routeName: (_) => Register(),
        },

      ),
    );
  }
}
