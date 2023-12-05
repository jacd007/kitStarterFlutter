import '../../modules/modules.dart';
import '../presentation.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers
    // Get.put(ThemeController());
    Get.put(AuthService());
    // Providers
    Get.put(AuthProvider());
  }
}
