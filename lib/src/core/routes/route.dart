import 'package:beaverbasketball/src/features/content/view/content_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteApp {
  static GoRouter route = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: "home",
        builder: (BuildContext context, GoRouterState state) {
          return ContentView(
            label: "home",
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                label: "about",
              );
            },
          ),
          GoRoute(
            path: 'gallery',
            name: 'gallery',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                label: "gallery",
              );
            },
          ),
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                label: "login",
              );
            },
          ),
        ],
      ),
    ],
  );
}
