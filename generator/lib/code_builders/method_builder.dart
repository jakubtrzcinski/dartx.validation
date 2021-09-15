import 'dart:collection';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dartx_validation_generator/code_builders/annotation_processors/email_annotation_processor.dart';
import 'package:dartx_validation_generator/code_builders/annotation_processors/max_annotation_processor.dart';
import 'package:dartx_validation_generator/code_builders/annotation_processors/min_annotation_processor.dart';
import 'package:dartx_validation_generator/code_builders/annotation_processors/not_blank_annotation_processor.dart';
import 'package:dartx_validation_generator/code_builders/annotation_processors/not_empty_annotation_processor.dart';

import 'annotation_processors/annotation_processor.dart';
import 'annotation_processors/not_null_annotation_processor.dart';
import 'annotation_processors/size_annotation_processor.dart';


/// Generates the implemented mapper method by the given abstract [MethodElement].
Method buildMapperImplementation(Map<String, List<DartObject>> config, ClassElement model) {
  var paramBuilder = ParameterBuilder();
  paramBuilder.type = refer(model.name);
  paramBuilder.name = 'model';
  return Method((b) => b
    ..name = 'validate'
    ..returns = refer('List<ValidationError>')
    ..requiredParameters.add(paramBuilder.build())
    ..body = _generateBody(config, model)
  );
}

var processors = <AnnotationProcessor>[
  NotNullAnnotationProcessor(),
  EmailAnnotationProcessor(),
  MaxAnnotationProcessor(),
  MinAnnotationProcessor(),
  NotBlankAnnotationProcessor(),
  NotEmptyAnnotationProcessor(),
  SizeAnnotationProcessor()
];

Code _generateBody(Map<String, List<DartObject>> config, ClassElement classElement) {
  final blockBuilder = BlockBuilder();
  blockBuilder.addExpression(refer('var errors = <ValidationError>[];'));
  for(var field in config.keys){
    var constraints = config[field]!;
    for(var constraint in constraints){
      for(var processor in processors){
        if(processor.supports(field, constraint)){
          var expressions = processor.process(field, constraint);
          for(var exp in expressions) {
            blockBuilder.addExpression(exp);
          }
        }
      }

    }
  }
  blockBuilder.addExpression(refer('return errors;'));
  return blockBuilder.build();
}
