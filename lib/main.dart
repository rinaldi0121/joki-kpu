import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/common/routes/pages.dart';
import 'package:kotak_saran_kp/global.dart';

void main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<BlocProvider> tempBlocProviders = (AppPages.allBlocProviders(context))
        .whereType<BlocProvider>()
        .map((dynamic item) => item as BlocProvider)
        .toList();

    return MultiBlocProvider(
      providers: tempBlocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
            color: Colors.red,
          ),
        ),
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}
