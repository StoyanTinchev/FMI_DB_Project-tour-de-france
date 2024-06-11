import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tour_de_france_app/feature/rankings_feature/dtos/cyclist_result_dto.dart';
import 'package:tour_de_france_app/injection.dart';

part 'general_rankings.g.dart';

@riverpod
Future<List<CyclistResultDTO>> fetchCyclistGeneralResults(
    FetchCyclistGeneralResultsRef ref, Dio dio) async {
  try {
    final response = await dio.get('/results/last-stage-sorted');
    final List<dynamic> results = response.data;

    final cyclistResults = results
        .map(
            (cyclistResultJson) => CyclistResultDTO.fromJson(cyclistResultJson))
        .toList();
    return cyclistResults;
  } catch (e) {
    throw e.toString();
  }
}

class GeneralRankings extends ConsumerWidget {
  const GeneralRankings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyclistResultList =
        ref.watch(fetchCyclistGeneralResultsProvider(getIt<Dio>()));
    return switch (cyclistResultList) {
        AsyncData(:final value) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
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
                      'TIME',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final isEvenRow = index % 2 == 1;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
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
      };
  }
}