part of 'validator_test_input.dart';

@Valid()
@ShouldGenerate(r'''
import 'package:dartx_validation/dartx_validation.dart';
import 'package:validators/validators.dart';

class FooSizeValidator {
  List<ValidationError> validate(FooSize model) {
    var errors = <ValidationError>[];
    ;
    if (model.list!.length < 1)
      errors.add(ValidationError('list', 'must contain at least 1 elements'));
    if (model.age! < 18.0)
      errors.add(ValidationError('age', 'cannot be lower than 18.0'));
    if (model.age! > 99.0)
      errors.add(ValidationError('age', 'cannot be higher than 99.0'));
    if (model.middleName == null)
      errors.add(ValidationError('middleName', 'cannot be null'));
    if (model.surname.isEmpty ?? true)
      errors.add(ValidationError('surname', 'cannot be empty'));
    if (model.occupation?.isEmpty ?? true)
      errors.add(ValidationError('occupation', 'cannot be blank'));
    return errors;
    ;
  }
}
''')
class FooSize {
  @Size(min:1)
  final List<String> list;

  @Min(18)
  @Max(99)
  final int age;
  @Length(min: 3, max: 16)
  final int name;
  @NotNull()
  final int middleName;
  @NotEmpty()
  final int surname;
  @NotBlank()
  final int occupation;

  FooSize(this.list, this.age, this.name, this.middleName, this.surname,
      this.occupation);
}
