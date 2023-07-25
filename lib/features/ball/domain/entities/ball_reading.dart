import 'package:equatable/equatable.dart';

import '../../data/models/ball_response/ball_reading_model.dart';

class BallReading extends Equatable {
  final String reading;

  const BallReading({
    required this.reading,
  });

  factory BallReading.fromModel(BallReadingModel model) =>
      BallReading(reading: model.reading);

  @override
  List<Object?> get props => [reading];
}
