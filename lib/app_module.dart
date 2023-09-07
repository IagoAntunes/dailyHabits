import 'package:flutter_modular/flutter_modular.dart';
import 'package:goodhabits/core/database/data.dart';

import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton(CacheAdapter.new);
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}
