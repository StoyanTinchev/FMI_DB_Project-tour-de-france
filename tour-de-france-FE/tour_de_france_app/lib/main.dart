import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_de_france_app/feature/rankings_feature/rankings_page.dart';
import 'package:tour_de_france_app/feature/teams_feature/team_cyclists_page.dart';
import 'package:tour_de_france_app/feature/teams_feature/team_list.dart';
import 'package:tour_de_france_app/injection.dart';
import 'package:tour_de_france_app/landing_page.dart';

void main() {
  configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
      routes: <RouteBase>[
        GoRoute(
            path: 'rankings',
            builder: (BuildContext context, GoRouterState state) {
              return const RankingsPage();
            }),
        GoRoute(
            path: 'teams',
            builder: (BuildContext context, GoRouterState state) {
              return const TeamListPage();
            },
            routes: [
            GoRoute(
              path: 'team/:teamName',
              builder: (BuildContext context, GoRouterState state) => TeamCyclistsPage(teamName: state.pathParameters['teamName'] ?? '')
            ),
          ],)
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Tour de France',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
          ),
          useMaterial3: true),
    );
  }
}