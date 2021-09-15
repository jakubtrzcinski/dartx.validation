import 'package:analyzer/dart/constant/value.dart';
import 'package:code_builder/code_builder.dart';

abstract class AnnotationProcessor {
  bool supports(String field, DartObject validator);
  List<Expression> process(String field, DartObject validator);
}
