import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', 
  preferRelativeImports: true, 
  asExtension: false, 
)
void configureDependencies() => $initGetIt(getIt);
