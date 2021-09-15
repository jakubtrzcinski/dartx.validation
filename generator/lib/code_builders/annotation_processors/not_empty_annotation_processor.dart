import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

import 'annotation_processor.dart';

class NotEmptyAnnotationProcessor extends AnnotationProcessor {

  @override
  bool supports(String field, DartObject validator) {
    return validator.type!.getDisplayString(withNullability: false) == 'NotEmpty';
  }

  List<Expression> process(String field, DartObject validator) {
    var ret = <Expression>[];
      ret.add(refer("if(model.$field.isEmpty ?? true)errors.add(ValidationError('$field', 'cannot be empty'))"));
    return ret;
  }
}
