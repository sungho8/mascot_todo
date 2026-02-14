/// Route paths for navigation
class RoutePath {
  RoutePath._();

  // Auth
  static const String login = '/login';
  static const String signup = '/signup';

  // Main
  static const String home = '/';
  static const String todo = '/todo';
  static const String mascot = '/mascot';
  static const String statistics = '/statistics';
  static const String achievement = '/achievement';
  static const String settings = '/settings';

  // Todo
  static const String todoDetail = '/todo/:id';
  static const String todoCreate = '/todo/create';

  // Mascot
  static const String mascotDetail = '/mascot/:id';
}
