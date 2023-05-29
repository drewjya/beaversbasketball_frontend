// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/src.dart';

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
      case NavbarFilter.gallery:
        return GalleryView();
      case NavbarFilter.schedule:
        return ScheduleView();
      case NavbarFilter.achievement:
        return AchievementView();
      case NavbarFilter.news:
        return NewsView();
      case NavbarFilter.login:
        return LoginView();
      case NavbarFilter.registration:
        return RegisterView();
    }
  }
}
