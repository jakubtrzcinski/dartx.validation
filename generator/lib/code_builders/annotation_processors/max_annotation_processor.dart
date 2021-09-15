import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

import 'annotation_processor.dart';

class MaxAnnotationProcessor extends AnnotationProcessor {
  @override
  bool supports(String field, DartObject validator) {
    return validator.type!.getDisplayString(withNullability: false) == 'Max';
  }

  List<Expression> process(String field, DartObject validator) {
    var ret = <Expression>[];
    var value = validator.getField('value')!.toDoubleValue();

    ret.add(refer(
        "if(model.$field! > $value)errors.add(ValidationError('$field', 'cannot be higher than $value'))"));

    return ret;
  }
}
