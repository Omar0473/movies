class Failure {
  String errorMsg;
  Failure({required this.errorMsg});
}
class SereverError extends Failure{
  SereverError({required super.errorMsg});
}