// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/content/view/about/about_content.dart';
import 'package:beaverbasketball/src/features/content/view/coach/coach_view.dart';
import 'package:beaverbasketball/src/features/content/view/home/home_content.dart';
import 'package:flutter/material.dart';

import 'package:beaverbasketball/src/core/common/constant/enum.dart';

class ContentBody extends StatelessWidget {
  final NavbarFilter filter;
  const ContentBody({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (filter) {
      case NavbarFilter.home:
        return HomeContent();
      case NavbarFilter.about:
        return AboutContent();

      case NavbarFilter.coach:
        return CoachView();
      default:
        return Center(
          child: Text(filter.value),
        );
    }
  }
}
