import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/services/bloc_observer.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main() {
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(430, 932),
      designSize: const Size(720, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.signInRoute,
        builder: EasyLoading.init(
          builder: BotToastInit(),
        ),
      ),
    );
  }
}
