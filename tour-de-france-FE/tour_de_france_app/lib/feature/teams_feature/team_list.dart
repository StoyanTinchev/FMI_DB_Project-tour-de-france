import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeamListPage extends StatelessWidget {
  const TeamListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> teams = ["Bora-Hansgrohe", "Movistar Team", "Team Sky"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(teams[index]),
              onTap: () {
                GoRouter.of(context).go('/teams/team/${teams[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}