import 'package:fpdart/fpdart.dart';
import '../exceptions/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
