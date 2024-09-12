class Metrics {

  final String CO2Emissions ;
  final String fuelSaved;

  Metrics({
    required this.CO2Emissions,
    required this.fuelSaved,
  });

  factory Metrics.fromFirestore(Map<String, dynamic> data) {
    return Metrics(
      CO2Emissions: data['CO2'],
      fuelSaved: data['Fuel'],

    );
  }
}