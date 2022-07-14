// ignore_for_file: equal_keys_in_map

import 'dart:io';
import 'answers.dart';
import 'read_data_create_maps.dart';

void main() {
  print("Ingrese el nombre del archivo");
  var fileName = stdin.readLineSync()!;

  final lines = File(fileName).readAsLinesSync();

  lines.removeAt(0);

  Map<String, int> deathsByStates = <String, int>{};
  Map<String, int> populationByStates = <String, int>{};

  readDataAndCreateMaps(deathsByStates, populationByStates, lines);
  answers(deathsByStates, populationByStates);

  //print(deathsByStates);
  //print(populationByStates);
}
