import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

import 'annotation_processor.dart';

class SizeAnnotationProcessor extends AnnotationProcessor {

  @override
  bool supports(String field, DartObject validator) {
    return validator.type!.getDisplayString(withNullability: false) == 'Size';
  }

  List<Expression> process(String field, DartObject validator) {
    var ret = <Expression>[];
    var min = validator.getField('min')!.toIntValue();
    var max = validator.getField('max')!.toIntValue();
    if (min != null) {
      ret.add(refer(
          "if(model.$field!.length < $min)errors.add(ValidationError('$field', 'must contain at least $min elements'))"));
    }
    if (max != null) {
      ret.add(refer(
          "if(model.$field!.length > $max)errors.add(ValidationError('$field', 'must not contain more than $max elements'))"));
    }
    return ret;
  }
}
