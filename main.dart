void main() {
  FibonacciRepository fibonacciRepository = FibonacciRepository();
  print(fibonacciRepository.goatsInYears());
}

class FibonacciRepository {
  goatsInYears() {
    try {
      int years = 80;
      List<int> goats = List.generate(
        years + 1,
        (index) => 0,
      );
      List<int> newGoats = List.generate(
        years + 1,
        (index) => 0,
      );
      goats.first = 1;

      for (int year = 1; year <= years; year++) {
        int offSprings = 0;
        for (int age = 2; age <= year; age++) {
          offSprings += goats[age];
        }
        newGoats[year] = offSprings;

        for (int age = year; age > 0; age--) {
          goats[age] = goats[age - 1];
        }

        goats.first = newGoats[year];
      }

      int totalGoats = 0;
      for (int age = 0; age <= years; age++) {
        totalGoats += goats[age];
      }
      return totalGoats;
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
