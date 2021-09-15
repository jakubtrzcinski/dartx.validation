import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

import 'annotation_processor.dart';

class EmailAnnotationProcessor extends AnnotationProcessor {

  @override
  bool supports(String field, DartObject validator) {
    return validator.type!.getDisplayString(withNullability: false) == 'Email';
  }

  List<Expression> process(String field, DartObject validator) {
    return [
      refer("if(!isEmail(model.$field))errors.add(ValidationError('$field', 'is not an email'))")
    ];
  }
}
