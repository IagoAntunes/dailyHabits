import 'package:flutter_modular/flutter_modular.dart';
import 'package:goodhabits/features/home/presenters/controllers/home_controller.store.dart';
import 'package:goodhabits/features/home/presenters/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
