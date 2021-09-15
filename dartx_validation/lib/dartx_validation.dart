library dartx_validation;

export 'src/annotations.dart';

class ValidationError {
  final String field;
  final String error;

  ValidationError(this.field, this.error);
}
