abstract class CustomException implements Exception {
  final String message;
  const CustomException({required this.message});
}

class ExpressionNotValid extends CustomException {
  const ExpressionNotValid({required String message}) : super(message: message);
}
