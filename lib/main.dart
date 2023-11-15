import 'package:dashboard/ui/pages/home.dart';
import 'package:dashboard/ui/pages/onboarding1.dart';
import 'package:dashboard/ui/pages/video.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_learning',
      theme: ThemeData(
        canvasColor:const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge:const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium:const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge:const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.white),
      ),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Onboarding(),
        '/home':(ctx)=>Home(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) {
            return  Onboarding();
          },
        );
      },
    );
  }
}


