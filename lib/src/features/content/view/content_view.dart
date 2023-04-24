// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beaverbasketball/src/core/common/constant/asset.dart';

class ContentView extends ConsumerWidget {
  final String label;
  const ContentView({required this.label, super.key});

  static const routeName = '/content';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 143, 23, 17), Colors.black87],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          title: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(AssetConstant.iconTextOnly, height: 40),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          actions: [
            NavigationItem(
              isActive: label == "home",
              label: "Home",
            ),
            SizedBox(
              width: 20,
            ),
            NavigationItem(
              isActive: label == "about",
              label: "About",
            ),
            SizedBox(
              width: 20,
            ),
            NavigationItem(
              isActive: label == "gallery",
              label: "Gallery",
            ),
            SizedBox(
              width: 20,
            ),
            NavigationItem(
              isActive: label == "login",
              label: "Login",
            ),
            SizedBox(
              width: 40,
            ),
          ],
          shadowColor: Colors.transparent,
        ),
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
                  color: Color.fromARGB(184, 226, 22, 63),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
