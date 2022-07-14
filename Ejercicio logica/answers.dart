void answers(Map deathsByStates, Map populationByStates ){
  List states = deathsByStates.keys.toList();
  String stateFinalMayor = "";
  int deathFinalMayor = 0;
  Map<String, int> stateAndDeathMenor = <String, int>{};
  Map<String, double> percentPopulationAndDeaths = <String, double>{};
  int deathFinalMenor = 0;
  String stateMajorPercent = "";
  double majorPercent = 0.0;

  states.forEach((state) {
    int deathCurrent = deathsByStates[state]!;
    if (deathCurrent > deathFinalMayor) {
      stateFinalMayor = state;
      deathFinalMayor = deathCurrent;
    }
    if (deathCurrent <= deathFinalMenor) {
      stateAndDeathMenor[state] = deathCurrent;
    }
    int deathsP = deathsByStates[state]!;
    int populationP = populationByStates[state]!;

    if (populationP == 0) {
      percentPopulationAndDeaths[state] = 0;
    } else {
      percentPopulationAndDeaths[state] = (deathsP / populationP) * 100;
    }
    double percentCurrent = percentPopulationAndDeaths[state]!;
    if (percentCurrent > majorPercent) {
      stateMajorPercent = state;
      majorPercent = percentCurrent;
    }
  });
  print('Solucion Pregunta 1:');
  print(
      'El estado con mayor muertes es: $stateFinalMayor, con un total de muertes de: $deathFinalMayor');
  print('Solucion pregunta 2:');
  for (String state in stateAndDeathMenor.keys.toList()) {
    print(
        'El estado con menor muertes es: $state, con un total de muertes de: ${stateAndDeathMenor[state]}');
  }
  print('Solucion pregunta 3:');
  for (String state in percentPopulationAndDeaths.keys.toList()) {
    print(
        'El estado de $state tiene un porcentaje de muertes vs poblacion total de: ${percentPopulationAndDeaths[state]} %');
  }
  print(
      'Por lo tanto el estado con mayor porcentaje de muertes por COVID19 es: $stateMajorPercent, con un porcentaje de: $majorPercent %, siendo asi el estado mas afectado por el COVID-19.');

}