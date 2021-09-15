part of 'validator_test_input.dart';

@Valid()
@ShouldGenerate(r'''
import 'package:dartx_validation/dartx_validation.dart';
import 'package:validators/validators.dart';

class FooNotNullValidator {
  List<ValidationError> validate(FooNotNull model) {
    var errors = <ValidationError>[];
    ;
    if (model.bar == null) errors.add(ValidationError('bar', 'cannot be null'));
    return errors;
    ;
  }
}
''')
class FooNotNull {
  @NotNull()
  final String? bar;
  FooNotNull(this.bar);
}
