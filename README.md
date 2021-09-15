# dartx_validation - Dart object validation made easy!

Librabry that is inspired by [javax.validation](https://docs.oracle.com/javaee/7/api/javax/validation/constraints/package-summary.html)

## Instalation
```
dependencies:
  dartx_validation: ^1.0.0
  
dev_dependencies:
  dartx_validation_generator: ^1.0.0
```
## Annotations
| Annotation   | Description |
|------------------|-------------|
| Valid | Use on class co indicate that validator needs to be generated |
| NotNull | The annotated element must be not-null |
| Email |The annotated element must be a string in email format |
| NotBlank | The annotated element must be a not empty string |
| Length | The annotated element must be a string whose length must be between the specified boundaries (included). |
| Size | The annotated element size must be between the specified boundaries (included). |
| NotEmpty | The annotated element must be a string whose is not null |
| Min | The annotated element must be a number whose value must be higher or equal to the specified minimum. |
| Max | The annotated element must be a number whose value must be lower or equal to the specified maximum. |


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
