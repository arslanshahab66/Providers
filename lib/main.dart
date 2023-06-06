import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/count_example.dart';
import 'package:flutter_provider/pages/dark_theme.dart';
import 'package:flutter_provider/pages/example_one.dart';
import 'package:flutter_provider/pages/favourite_app.dart';
import 'package:flutter_provider/pages/home_page.dart';
import 'package:flutter_provider/pages/login.dart';
import 'package:flutter_provider/providers/count_provider.dart';
import 'package:flutter_provider/providers/example_one_provider.dart';
import 'package:flutter_provider/providers/fav_item_provder.dart';
import 'package:flutter_provider/providers/login_provider.dart';
import 'package:flutter_provider/providers/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemprovider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: ((context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            primaryColor: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            primaryColor: Colors.yellow,
            appBarTheme: const AppBarTheme(
              color: Colors.teal,
            ),
          ),
          home: const LoginScreen(),
        );
      })),
    );
  }
}
