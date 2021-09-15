import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class AnnotationReader {
  final ClassElement clazz;

  AnnotationReader(this.clazz);

  Map<String, List<DartObject>> readValidators() {
    final config = <String, List<DartObject>>{};
    for(var field in clazz.fields){
      config[field.name] = field.metadata.map((e) => ConstantReader(e.computeConstantValue()).objectValue).toList();
    }
    return config;
  }

}
