import '../presentation.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Providers
    // Get.put(XXXXProvider());
    // Controllers
    Get.put(AuthService());
    Get.put(AllController());
    Get.put(HomeController());
  }
}
