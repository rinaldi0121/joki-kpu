import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/myAdmin/admin_page.dart';
import 'package:kotak_saran_kp/common/routes/names.dart';
import 'package:kotak_saran_kp/global.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_blocs.dart';
import 'package:kotak_saran_kp/kotak_saran/kotak_saran_page.dart';
import 'package:kotak_saran_kp/login/bloc/login_blocs.dart';
import 'package:kotak_saran_kp/login/login_page.dart';
import 'package:kotak_saran_kp/register/bloc/register_blocs.dart';
import 'package:kotak_saran_kp/register/register_page.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const LoginPage(),
        bloc: BlocProvider(lazy: true, create: (_) => LoginBlocs()),
      ),
      PageEntity(
        route: AppRoutes.logIn,
        page: const LoginPage(),
        bloc: BlocProvider(lazy: true, create: (_) => LoginBlocs()),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const RegisterPage(),
        bloc: BlocProvider(lazy: true, create: (_) => RegisterBlocs()),
      ),
      PageEntity(
        route: AppRoutes.kotakSaranPage,
        page: const KotakSaranPage(),
        bloc: BlocProvider(lazy: true, create: (_) => KotakSaranBloc()),
      ),
      PageEntity(
        route: AppRoutes.adminPage,
        page: const AdminPage(),
      ),
    ];
  }

// use this instead of bloc_providers.dart class
// we will find out how to use this shit later
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

// perfect place to save the route info to localstorage cause this method will check all routers informations
// like names and the widget pages
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // checking routename
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedInAsAdmin = Global.storageService.getIsLoggedInAsAdmin();
          bool isLoggedInAsUser = Global.storageService.getIsLoggedInAsUser();
          if (isLoggedInAsAdmin) {
            return MaterialPageRoute(
                builder: (_) => const AdminPage(),
                settings: settings); //Navigate to Admin Page
          }
          if (isLoggedInAsUser) {
            return MaterialPageRoute(
                builder: (_) => const KotakSaranPage(), settings: settings);
          }
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: settings);
  }
}

class PageEntity {
  PageEntity({required this.route, required this.page, this.bloc});

  dynamic bloc;
  Widget page;
  String route;
}
