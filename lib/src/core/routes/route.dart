import 'package:beaverbasketball/src/features/content/view/registration/peraturan_screen.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
        Widget child) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };

class RouteApp {
  static GoRouter route = GoRouter(
    errorBuilder: (context, state) {
      return ContentView(
        filter: NavbarFilter.home,
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: "home",
        builder: (BuildContext context, GoRouterState state) {
          return ContentView(
            filter: NavbarFilter.home,
          );
        },
        pageBuilder: defaultPageBuilder(
          ContentView(
            filter: NavbarFilter.home,
          ),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.about,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.about,
              ),
            ),
          ),
          GoRoute(
            path: 'coach',
            name: 'coach',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.coach,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.coach,
              ),
            ),
          ),
          GoRoute(
            path: 'gallery',
            name: 'gallery',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.gallery,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.gallery,
              ),
            ),
          ),
          GoRoute(
            path: 'schedule',
            name: 'schedule',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.schedule,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.schedule,
              ),
            ),
          ),
          GoRoute(
              path: 'registration',
              name: 'registration',
              builder: (BuildContext context, GoRouterState state) {
                return ContentView(
                  filter: NavbarFilter.registration,
                );
              },
              pageBuilder: defaultPageBuilder(
                ContentView(
                  filter: NavbarFilter.registration,
                ),
              ),
              routes: [
                GoRoute(
                  path: 'tata-tertib',
                  name: 'tata-tertib',
                  pageBuilder: defaultPageBuilder(
                    ContentView(
                      filter: NavbarFilter.registration,
                      body: PeraturanContent(),
                    ),
                  ),
                ),
              ]),
          GoRoute(
            path: 'achievement',
            name: 'achievement',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.achievement,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.achievement,
              ),
            ),
          ),
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.login,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.login,
              ),
            ),
          ),
          GoRoute(
            path: 'news',
            name: 'news',
            builder: (BuildContext context, GoRouterState state) {
              return ContentView(
                filter: NavbarFilter.news,
              );
            },
            pageBuilder: defaultPageBuilder(
              ContentView(
                filter: NavbarFilter.news,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
