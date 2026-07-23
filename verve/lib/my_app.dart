// my_app.dart
import 'package:flutter/material.dart';
import 'package:verve/features/auth/views/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/features/auth/views/register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.routeName,
        routes: {
          LoginView.routeName: (context) => LoginView(),
          RegisterView.routeName: (context) => RegisterView(),
        },
      ),
    );
  }
}
