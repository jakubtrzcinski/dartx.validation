import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

import 'annotation_processor.dart';

class NotNullAnnotationProcessor extends AnnotationProcessor {

  @override
  bool supports(String field, DartObject validator) {
    return validator.type!.getDisplayString(withNullability: false) == 'NotNull';
  }

  List<Expression> process(String field, DartObject validator) {
    return [
      refer("if(model.$field == null)errors.add(ValidationError('$field', 'cannot be null'))")
    ];
  }
}
