class Sets {
  final int reps;
  final double weight;
  const Sets({required this.reps, required this.weight});

  Sets copyWith({
    int? reps,
    double? weight,
  }) {
    return Sets(
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
    );
  }
}
