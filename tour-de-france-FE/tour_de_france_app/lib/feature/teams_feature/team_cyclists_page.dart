import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tour_de_france_app/feature/rankings_feature/dtos/cyclist_result_dto.dart';
import 'package:tour_de_france_app/injection.dart';

part 'team_cyclists_page.g.dart';

@riverpod
Future<List<CyclistResultDTO>> fetchCyclistsByTeam(
  FetchCyclistsByTeamRef ref,
  Dio dio,
  String teamName,
) async {
  try {
    final response = await dio.get('/cyclists/team?teamName=$teamName');
    final List<dynamic> results = response.data;

    final cyclistResults = results.map((cyclistResultJson) {
      final Map<String, dynamic> json = {
        ...cyclistResultJson,
        'stageNumber': 0,
        'stageTime': '',
        'totalTime': '',
      };
      return CyclistResultDTO.fromJson(json);
    }).toList();
    return cyclistResults;
  } catch (e) {
    throw e.toString();
  }
}

class TeamCyclistsPage extends ConsumerWidget {
  const TeamCyclistsPage({super.key, required this.teamName});

  final String teamName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyclistResultList =
        ref.watch(fetchCyclistsByTeamProvider(getIt<Dio>(), teamName));

    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'REG. NO.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NAME',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: switch (cyclistResultList) {
                AsyncData(:final value) => ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final isEvenRow = index % 2 == 1;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
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
                              "${value[index].registrationNumber}",
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
                          ],
                        ),
                      );
                    },
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
            ),
          ],
        ),
      ),
    );
  }
}
