import 'package:beaverbasketball/src/src.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
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
        colorScheme: Theme.of(context).colorScheme.copyWith(
              background: Colors.black,
            ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primaryColor: Color(0xffEB1328),
      ),
    );
  }
}
