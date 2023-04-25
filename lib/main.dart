import 'package:beaverbasketball/src/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(
    overrides: [],
    child: BeaversApp(),
  ));
}

class BeaversApp extends ConsumerWidget {
  const BeaversApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      title: 'Beavers Basketball',
      routerConfig: RouteApp.route,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        primaryColor: Colors.red,
      ),
    );
  }
}
