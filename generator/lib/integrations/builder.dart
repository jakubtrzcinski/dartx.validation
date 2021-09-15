import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../generators/validator_generator.dart';

/// Main Builder for the [Mapping] Annotation
Builder dartxvalidationBuilder(BuilderOptions options) =>
    PartBuilder([ValidatorGenerator()], 'Validator.g.dart');
