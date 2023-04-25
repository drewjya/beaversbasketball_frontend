// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/core/common/constant/enum.dart';
import 'package:beaverbasketball/src/features/content/widget/content_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beaverbasketball/src/core/common/constant/asset.dart';

class ContentView extends HookConsumerWidget {
  final NavbarFilter filter;
  const ContentView({required this.filter, super.key});

  static const routeName = '/content';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          backgroundColor: Color(0xffEA5455),
          child: ListView(
            children: [
              NavigationItem(
                isActive: filter == NavbarFilter.home,
                label: "Home",
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
                isActive: filter == NavbarFilter.store,
                label: "Store",
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
                isActive: filter == NavbarFilter.registration,
                label: "Registration",
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ),
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          title: InkWell(
            onTap: () {
              context.replaceNamed("home");
            },
            child: Image.asset(AssetConstant.iconTextOnly, height: 40),
          ),
          backgroundColor: Color(0xffEA5455),
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
                    isActive: filter == NavbarFilter.store,
                    label: "Store",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigationItem(
                    isActive: filter == NavbarFilter.news,
                    label: "News",
                  ),
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
        body: ContentBody(filter: filter),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String label;
  final bool isActive;
  const NavigationItem({
    Key? key,
    required this.label,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onHover: (value) {},
        onTap: (!isActive)
            ? () => context.replaceNamed(label.toLowerCase())
            : null,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
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
