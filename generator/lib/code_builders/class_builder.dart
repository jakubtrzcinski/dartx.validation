import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dartx_validation_generator/code_builders/method_builder.dart';

Class buildMapperClass(
    ClassElement model, Map<String, List<DartObject>> config) {
  return Class(
    (b) => b
      ..name = '${model.displayName}Validator'
      ..methods.add(buildMapperImplementation(config, model))
  );
}
