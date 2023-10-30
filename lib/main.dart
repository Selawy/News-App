

import 'package:api_test/http/http_helper.dart';
import 'package:api_test/models/all_pro.dart';
import 'package:api_test/screen/count.dart';
import 'package:api_test/screen/home.dart';

import 'package:api_test/screen/home_screen.dart';
import 'package:api_test/theme/my_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bloc/count_cubit.dart';
import 'cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
      ],

      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: homeCubit.isDark?MyTheme.darkTheme : MyTheme.lightTheme ,
            home: const Home(),
          );
        },
      ),
    );
  }
}
