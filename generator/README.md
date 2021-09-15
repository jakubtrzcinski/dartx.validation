# dartx_validation - Dart object validation made easy!

Librabry that is inspired by [javax.validation](https://docs.oracle.com/javaee/7/api/javax/validation/constraints/package-summary.html)

## Examples

```dart
@Valid()
class FooSize {
  @Size(min:1)
  final List<String> list;
  FooSize(this.list);
}
```
Will generate

```dart
class FooSizeValidator {
  List<ValidationError> validate(FooSize model) {
    var errors = <ValidationError>[];
    ;
    if (model.list!.length < 1)
      errors.add(ValidationError('list', 'must contain at least 1 elements'));
    return errors;
    ;
  }
}
```
