enum NavbarFilter {
  home(value: "home"),
  coach(value: "coach"),
  about(value: "about"),
  gallery(value: "gallery"),
  schedule(value: "schedule"),
  registration(value: "registration"),
  achievement(value: "achievement"),
  store(value: "store"),
  news(value: "news");

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
}
