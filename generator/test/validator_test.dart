import 'package:dartx_validation_generator/generators/validator_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  initializeBuildLogTracking();
  final reader = await initializeLibraryReaderForDirectory(
    p.join('test', 'src'),
    'validator_test_input.dart',
  );

  testAnnotatedElements(
    reader,
    ValidatorGenerator(),
    expectedAnnotatedTests: _expectedAnnotatedTests,
  );
}

const _expectedAnnotatedTests = {
  'FooSize',
  'FooNotNull'
};
