enum NavbarFilter {
  home(value: "home"),
  coach(value: "coach"),
  about(value: "about"),
  gallery(value: "gallery"),
  schedule(value: "schedule"),
  registration(value: "registration"),
  achievement(value: "achievement"),
  news(value: "news"),
  users(value: "users"),
  login(value: "login");

  final String value;
  const NavbarFilter({required this.value});
}

extension MapIndexssa<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(
      R Function(int index, T element, bool first, bool last) convert) sync* {
    var index = 0;

    for (var element in this) {
      yield convert(index++, element, index == 0, index == (length));
    }
  }

  Iterable<R> mapFixed<R>(R Function(T element, int index) convert) sync* {
    final count = length;
    for (var i = 0; i < count; i++) {
      yield convert(elementAt(i), i);
    }
  }
}
