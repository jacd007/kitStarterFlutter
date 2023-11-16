import '../presentation.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
  }
}
