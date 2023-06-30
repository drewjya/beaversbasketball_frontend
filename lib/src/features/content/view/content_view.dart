// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:beaverbasketball/src/src.dart';
import 'package:go_router/go_router.dart';

final isNewsDetailProvider = StateProvider<bool>((ref) {
  return false;
});

class ContentView extends HookConsumerWidget {
  final NavbarFilter filter;
  const ContentView({
    required this.filter,
    this.body,
  });
  final Widget? body;

  static const routeName = '/content';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          backgroundColor: NAVBAR,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    NavigationItem(
                      isActive: filter == NavbarFilter.home,
                      label: "Home",
                      labelWidget: Text(
                        "BEAVERS BASKETBALL CLUB",
                        style: TextStyle(
                          fontFamily: "Demonized",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.coach,
                      label: "Coach",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.about,
                      label: "About",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.gallery,
                      label: "Gallery",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.schedule,
                      label: "Schedule",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.achievement,
                      label: "Achievement",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.news,
                      label: "News",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    NavigationItem(
                      isActive: filter == NavbarFilter.login,
                      label: "Login (Admin)",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if (ref.watch(authProvider).value != null) ...[
                      NavigationItem(
                        isActive: filter == NavbarFilter.users,
                        label: "Users",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                    NavigationItem(
                      isActive: filter == NavbarFilter.registration,
                      label: "Registration",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Spacer(),
                    Text("Stay Together And Be Brave"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          title: GestureDetector(
            onTap: () {
              ref.invalidate(isNewsDetailProvider);
              context.replaceNamed("home");
            },
            child: FittedBox(
              child: Row(
                children: [
                  Image.asset(AssetConstant.iconBorderBlack, height: 80),
                  Text.rich(
                    TextSpan(
                      text: "BEAVERS BASKETBALL CLUB",
                      style: TextStyle(
                        fontFamily: "Demonized",
                        fontSize: isActionEnabled ? 15 : 10,
                      ),
                      children: [
                        TextSpan(
                            text: "\nSTAY TOGETHER AND BE BRAVE",
                            style: TextStyle(
                              fontSize: isActionEnabled ? 10 : 7,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: NAVBAR,
          actions: isActionEnabled
              ? [
                  NavigationItem(
                    isActive: filter == NavbarFilter.home,
                    label: "Home",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.coach,
                    label: "Coach",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.about,
                    label: "About",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.gallery,
                    label: "Gallery",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.schedule,
                    label: "Schedule",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.achievement,
                    label: "Achievement",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.news,
                    label: "News",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.login,
                    label: "Login (Admin)",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  if (ref.watch(authProvider).value != null) ...[
                    NavigationItem(
                      isActive: filter == NavbarFilter.users,
                      label: "Users",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                  NavigationItem(
                    isActive: filter == NavbarFilter.registration,
                    label: "Registration",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ]
              : [
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: Icon(Icons.menu)),
                ],
          shadowColor: Colors.transparent,
        ),
        body: body ?? ContentBody(filter: filter),
      ),
    );
  }
}

class NavigationItem extends ConsumerWidget {
  final String label;
  final bool isActive;
  final Widget? labelWidget;
  const NavigationItem({
    Key? key,
    this.labelWidget,
    required this.label,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: InkWell(
        onHover: (value) {},
        onTap: () {
          ref.invalidate(isNewsDetailProvider);
          log(label);

          if (ref.read(authProvider).value != null &&
              ref.read(authProvider).value!.isNotEmpty &&
              label == "Login (Admin)") {
            print(ref.read(authProvider).value);
            ref.read(authProvider.notifier).logOut();
          }
          context.replaceNamed(
              label == "Login (Admin)" ? "login" : label.toLowerCase());
        },
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: labelWidget ??
                  Text(
                    label,
                  ),
            ),
            if (isActive)
              Positioned(
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 2,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
