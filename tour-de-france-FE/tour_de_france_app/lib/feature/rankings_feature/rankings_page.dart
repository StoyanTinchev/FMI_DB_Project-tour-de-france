import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:tour_de_france_app/feature/rankings_feature/general_rankings.dart';
import 'package:tour_de_france_app/feature/rankings_feature/stage_rankings.dart';

class RankingsPage extends StatefulWidget {
  const RankingsPage({super.key});

  @override
  State<RankingsPage> createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rankings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: Column(
        children: [
          CupertinoSlidingSegmentedControl<int>(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            thumbColor: Colors.amber,
            backgroundColor: Colors.amber.withOpacity(0.2),
            children: const {
              0: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('General'),
              ),
              1: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Stage'),
              ),
            },
            groupValue: _selectedSegment,
            onValueChanged: (value) {
              setState(() {
                _selectedSegment = value ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _selectedSegment == 0
                  ? const GeneralRankings()
                  : const StageRankings(),
            ),
          ),
        ],
      ),
    );
  }
}
