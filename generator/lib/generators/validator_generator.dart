import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dartx_validation/dartx_validation.dart';
import 'package:dartx_validation_generator/code_builders/class_builder.dart';
import 'package:source_gen/source_gen.dart';
import '../annotation_reader.dart';

class ValidatorGenerator extends GeneratorForAnnotation<Valid> {
  @override
  dynamic generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          '${element.displayName} is not a class and cannot be annotated with @Valid',
          element: element
      );
    }

    var config = AnnotationReader(element).readValidators();

    final mapperImpl = buildMapperClass(element, config);
    final emitter = DartEmitter();
    return "import 'package:dartx_validation/dartx_validation.dart';\nimport 'package:validators/validators.dart';\n\n${mapperImpl.accept(emitter)}";
  }
}
