import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tour_de_france_app/feature/rankings_feature/dtos/cyclist_result_dto.dart';
import 'package:tour_de_france_app/injection.dart';

part 'stage_rankings.g.dart';

@riverpod
Future<List<CyclistResultDTO>> fetchCyclistResultsForStage(
    FetchCyclistResultsForStageRef ref, Dio dio, int stageNumber) async {
  try {
    final response = await dio.get('/results/sorted-stage?stageNumber=$stageNumber');
    final List<dynamic> results = response.data;

    final cyclistResults = results
        .map((cyclistResultJson) => CyclistResultDTO.fromJson(cyclistResultJson))
        .toList();
    return cyclistResults;
  } catch (e) {
    throw e.toString();
  }
}

class StageRankings extends ConsumerStatefulWidget {
  const StageRankings({super.key});

  @override
  StageRankingsState createState() => StageRankingsState();
}

class StageRankingsState extends ConsumerState<StageRankings> {
  int selectedStage = 1;

  @override
  Widget build(BuildContext context) {
    final List<int> stages = List.generate(3, (index) => index + 1); // Assuming 3 stages
    var cyclistResultList = ref.watch(fetchCyclistResultsForStageProvider(getIt<Dio>(), selectedStage));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButton<int>(
                value: selectedStage,
                dropdownColor: Colors.amber,
                icon: const Icon(Icons.arrow_downward, color: Colors.white),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      selectedStage = value;
                    });
                    cyclistResultList = ref.refresh(fetchCyclistResultsForStageProvider(getIt<Dio>(), selectedStage));
                  }
                },
                items: stages.map<DropdownMenuItem<int>>((int stage) {
                  return DropdownMenuItem<int>(
                    value: stage,
                    child: Text(
                      'Stage $stage',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POS.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  'NAME',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  'STAGE TIME',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  'TOTAL TIME',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
        switch (cyclistResultList) {
          AsyncData(:final value) => Expanded(
            child: ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final isEvenRow = index % 2 == 1;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: isEvenRow ? Colors.amber : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1}.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isEvenRow ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        value[index].cyclistName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isEvenRow ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        value[index].stageTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isEvenRow ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        value[index].totalTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isEvenRow ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          AsyncError(:final error) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Error: $error',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ],
    );
  }
}