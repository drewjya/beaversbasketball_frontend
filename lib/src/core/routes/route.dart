import 'package:beaverbasketball/src/core/common/constant/enum.dart';
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
            filter: NavbarFilter.home,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.about,
              );
            },
          ),
          GoRoute(
            path: 'coach',
            name: 'coach',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.coach,
              );
            },
          ),
          GoRoute(
            path: 'gallery',
            name: 'gallery',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.gallery,
              );
            },
          ),
          GoRoute(
            path: 'schedule',
            name: 'schedule',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.schedule,
              );
            },
          ),
          GoRoute(
            path: 'registration',
            name: 'registration',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.registration,
              );
            },
          ),
          GoRoute(
            path: 'achievement',
            name: 'achievement',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.achievement,
              );
            },
          ),
          GoRoute(
            path: 'store',
            name: 'store',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.store,
              );
            },
          ),
          GoRoute(
            path: 'news',
            name: 'news',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.news,
              );
            },
          ),
        ],
      ),
    ],
  );
}
