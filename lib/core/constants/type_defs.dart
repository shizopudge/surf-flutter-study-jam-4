import 'package:dartz/dartz.dart';

import '../domain/entities/failure/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
