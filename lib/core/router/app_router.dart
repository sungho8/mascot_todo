import 'package:go_router/go_router.dart';
import '../../presentation/views/main/main_view.dart';
import '../../presentation/views/home/home_view.dart';
import '../../presentation/views/collection/collection_view.dart';
import '../../presentation/views/statistics/statistics_view.dart';
import '../../presentation/views/settings/settings_view.dart';
import '../../presentation/views/auth/login_view.dart';
import '../constants/route_path.dart';

/// App router configuration
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePath.login,
    routes: [
      // 로그인
      GoRoute(
        path: RoutePath.login,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginView(),
        ),
      ),

      // 메인 앱 (인증 필요)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          // 홈
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.home,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeView(),
                ),
              ),
            ],
          ),

          // 컬렉션
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/collection',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CollectionView(),
                ),
              ),
            ],
          ),

          // 통계
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.statistics,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StatisticsView(),
                ),
              ),
            ],
          ),

          // 설정
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.settings,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SettingsView(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
