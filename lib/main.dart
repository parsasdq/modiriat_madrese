import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'module/theme.dart';
import 'pages/Homepage/home_page.dart';
import 'bloc/bloc_state.dart';
import 'bloc/user_bloc.dart';


import 'pages/Login.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(create: (ctx) => UserBloc()),
    BlocProvider<ThemeBloc>(create: (ctx) => ThemeBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, BlocState>(
        builder: (_, state) => MaterialApp(
          theme: AppThemeData[state is ThemeState ? state.theme: Themeenum.light],
              debugShowCheckedModeBanner: false,
              title: 'madrese binary',
              home: BlocBuilder<UserBloc, BlocState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return const HomePage();
                  } else {
                    return Login(
                      state: state,
                    );
                  }
                },
              ),
            ));
  }
}
