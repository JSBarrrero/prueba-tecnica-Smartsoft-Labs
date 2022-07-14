void readDataAndCreateMaps(Map deathsByStates, Map populationByStates, List lines){
  for (dynamic line in lines) {
    final List values = line.split(',');

    String stateName = values[6];
    int deaths = int.parse(values[values.length - 1]);
    int population = int.parse(values[10]);

    bool haveStateKey = deathsByStates.containsKey(stateName);
    if (haveStateKey) {
      int currentDeaths = deathsByStates[stateName]!;
      deathsByStates[stateName] = deaths + currentDeaths;
    } else {
      deathsByStates[stateName] = deaths;
    }
    bool haveStateKeyInPopulationMap =
        populationByStates.containsKey(stateName);
    if (haveStateKeyInPopulationMap) {
      int currentPopulation = populationByStates[stateName]!;
      populationByStates[stateName] = population + currentPopulation;
    } else {
      populationByStates[stateName] = population;
    }
  }
}